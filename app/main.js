import { Sesion } from "./class/sesion.js";
import { ReportManager } from "./class/ReportManager.js";

document.addEventListener("DOMContentLoaded", async () => {

    const ensamblarTags = document.getElementsByTagName("ensamblar");

    // Convertimos en array real
    const tareas = Array.from(ensamblarTags).map(async (tag) => {

        const src = tag.getAttribute("src");
        if (!src) return;

        try {
            const response = await fetch(src);
            const html = await response.text();
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

                document.body.appendChild(newScript);
                oldScript.remove();
            });

        } catch (error) {
            tag.innerHTML = "<p>Error cargando el contenido.</p>";
            console.error("Error al cargar", src, error);
        }
    });

    // Esperar a TODAS las ensambladuras
    await Promise.all(tareas);
    window.Report = new ReportManager();

    // emite un evento cuando termina <ensamblar>
    document.dispatchEvent(new CustomEvent("ensamblar:ready"));
    const sesion = new Sesion();
});