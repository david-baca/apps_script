import { Sesion } from "./class/sesion.js";
import { ReportManager } from "./class/ReportManager.js";

document.addEventListener("DOMContentLoaded", async () => {
    // Cargar todos los componentes ensamblar
    await cargarComponentes();
    
    // Inicializar report manager
    globalThis.Report = new ReportManager();
    
    // Emitir evento cuando todo esté listo
    document.dispatchEvent(new CustomEvent("ensamblar:ready"));
    
    // Inicializar sesión
    const sesion = new Sesion();
});

async function cargarComponentes() {
    const ensamblarTags = document.getElementsByTagName("ensamblar");
    const tareas = Array.from(ensamblarTags).map(async (tag) => {
        await procesarComponente(tag);
    });
    
    await Promise.all(tareas);
}

async function procesarComponente(tag) {
    const src = tag.getAttribute("src");
    if (!src) return;

    try {
        const response = await fetch(src);
        let html = await response.text();
        
        // Procesar atributo miken_datos si existe
        const mikenDatos = tag.getAttribute("miken_datos");
        if (mikenDatos) {
            const datos = procesarMikenDatos(mikenDatos);
            html = reemplazarMarcadores(html, datos);
        }
        
        // Insertar HTML procesado
        tag.innerHTML = html;
        
        // Ejecutar scripts del HTML insertado
        const scripts = tag.querySelectorAll("script");
        
        scripts.forEach((oldScript) => {
            const newScript = document.createElement("script");
            
            if (oldScript.src) {
                newScript.src = oldScript.src;
            } else {
                newScript.textContent = oldScript.textContent;
            }
            
            // Marcar si es type="module"
            if (oldScript.type === "module") {
                newScript.type = "module";
            }
            
            document.body.appendChild(newScript);
            oldScript.remove();
        });

    } catch (error) {
        console.error("Error al cargar", src, error);
        tag.innerHTML = `<p class="text-error">Error cargando: ${src}</p>`;
    }
}

function procesarMikenDatos(mikenDatos) {
    try {
        // Evaluar el contenido de miken_datos
        const resultado = eval(`(${mikenDatos})`);
        
        // Si es una función, ejecutarla
        if (typeof resultado === 'function') {
            return resultado();
        }
        
        // Si es un objeto, devolverlo
        return resultado;
        
    } catch (error) {
        console.error("Error procesando miken_datos:", error);
        return {};
    }
}

function reemplazarMarcadores(html, datos) {
    if (!datos || typeof datos !== 'object') return html;
    
    // Reemplazar marcadores: {{nombre}} -> datos.nombre
    return html.replace(/\{\{(\w+)\}\}/g, (match, clave) => {
        return datos[clave] !== undefined ? datos[clave] : match;
    });
}