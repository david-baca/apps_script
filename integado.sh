#!/bin/bash

# Script para generar la estructura completa del proyecto Apps Script + Frontend
# Ejecutar desde la raíz del repositorio (donde se mostrará el árbol)

set -e  # Salir si hay error

echo "🚀 Creando estructura de directorios..."

# Directorios base
mkdir -p src/componentes/tarjetas
mkdir -p src/css
mkdir -p src/forms
mkdir -p src/secciones
mkdir -p views/products
mkdir -p miken_clasp/class
mkdir -p miken_clasp/services
mkdir -p miken_clasp/utils
mkdir -p miken_clasp/promocion
mkdir -p 01_Documentacion

echo "📄 Creando archivos..."

# ========== ARCHIVOS PRINCIPALES (raíz) ==========

cat > README.md << 'EOF'
# Proyecto Apps Script + Frontend

Este proyecto conecta un frontend estático (HTML/CSS/JS) con un backend en Google Apps Script que actúa como base de datos sobre Google Sheets.

## Estructura

- `src/`: componentes reutilizables (CSS, fragmentos HTML)
- `views/`: páginas completas (login, productos, etc.)
- `miken_clasp/`: lógica de frontend (clases, servicios, utilidades)
- `01_Documentacion/`: notas y documentación

## Despliegue

1. Subir a GitHub Pages desde la rama main (carpeta raíz).
2. Configurar la URL del backend en `miken_clasp/env.js`.
3. Ajustar `PROYECT_NAME` según el nombre del repositorio si es necesario.
EOF

cat > exportar.sh << 'EOF'
#!/bin/bash
# Script para exportar/limpiar (personalizar según necesidad)
echo "Exportar script - pendiente de implementación"
EOF

cat > proyecto.txt << 'EOF'
Resumen del proyecto: Frontend con autenticación por tokens y conexión a Apps Script.
EOF

# ========== src/css ==========

cat > src/css/main.css << 'EOF'
@import url(./reportmanager.css);

:root {
  --color-primario: #0b1c2d;
  --color-secundario: #957737;
  --color-auxiliar: #1f3a5f;
  --color-auxiliar-secundario: #c9b37e;
  --color-complementario: #2d2d2d;
  --color-complementario-secundario: #f2f2f2;
  --color-matriz: #111827;
  --color-sombra: rgba(0,0,0,0.2);
  --color-blanco: #ffffff;
  --color-negro: #000000;
  --color-sem-error: #ff0000;
  --color-sem-success: #00ff00;
  --color-sem-warning: #ffcc00;
  --color-sem-info: #0099ff;

  --font-family-principal: "Arial", sans-serif;
  --font-size-h1: 2.5rem;
  --font-size-h2: 2rem;
  --font-size-h3: 1.75rem;
  --font-size-h4: 1.5rem;
  --font-size-h5: 1.25rem;
  --font-size-h6: 1rem;
  --font-size-texto: 1rem;
  --font-size-texto-secundario: 0.9rem;
  --font-size-texto-pequeño: 0.8rem;

  --space-padding-xs: 4px;
  --space-padding-sm: 8px;
  --space-padding-md: 16px;
  --space-padding-lg: 24px;
  --space-padding-xl: 32px;
  --space-gap-xs: 4px;
  --space-gap-sm: 8px;
  --space-gap-md: 16px;
  --space-gap-lg: 24px;
  --space-gap-xl: 32px;

  --border-radius-xs: 2px;
  --border-radius-sm: 4px;
  --border-radius-md: 8px;
  --border-radius-lg: 12px;
  --border-radius-xl: 16px;

  --shadow-xs: 0 1px 2px rgba(0,0,0,0.1);
  --shadow-sm: 0 2px 4px rgba(0,0,0,0.1);
  --shadow-md: 0 4px 8px rgba(0,0,0,0.15);
  --shadow-lg: 0 6px 12px rgba(0,0,0,0.2);
  --shadow-xl: 0 8px 16px rgba(0,0,0,0.25);
}

*{ margin:0; padding:0; font-family: var(--font-family-principal); }

.container { width: 100%; }
.row { display: flex; flex-wrap: wrap; margin-right: calc(-1 * var(--space-gap-md) / 2); margin-left: calc(-1 * var(--space-gap-md) / 2); }
[class*="col-"] { box-sizing: border-box; flex: 0 0 auto; }

.col-1 { width: calc(8.333%); }
.col-2 { width: calc(16.666%); }     
.col-3 { width: calc(24.999%); }     
.col-4 { width: calc(33.333%); }     
.col-5 { width: calc(41.666%); } 
.col-6 { width: calc(49.333%); } 
.col-7 { width: calc(58.333%); } 
.col-8 { width: calc(66.666%); }
.col-9 { width: calc(74.999%); }
.col-10 { width: calc(83.333%); }
.col-11 { width: calc(91.666%); }
.col-12 { width: calc(99.999%); }
.col { flex: 1 0 0%; }

@media (min-width: 576px) {
  .col-sm-1 { width: calc(8.333%); } .col-sm-2 { width: calc(16.666%); } .col-sm-3 { width: calc(24.999%); } .col-sm-4 { width: calc(33.333%); } .col-sm-5 { width: calc(41.666%); } .col-sm-6 { width: calc(49.333%); } .col-sm-7 { width: calc(58.333%); } .col-sm-8 { width: calc(66.666%); } .col-sm-9 { width: calc(74.999%); } .col-sm-10 { width: calc(83.333%); } .col-sm-11 { width: calc(91.666%); } .col-sm-12 { width: calc(99.999%); }
}
@media (min-width: 768px) {
  .col-md-1 { width: calc(8.333%); } .col-md-2 { width: calc(16.666%); } .col-md-3 { width: calc(24.999%); } .col-md-4 { width: calc(33.333%); } .col-md-5 { width: calc(41.666%); } .col-md-6 { width: calc(49.333%); } .col-md-7 { width: calc(58.333%); } .col-md-8 { width: calc(66.666%); } .col-md-9 { width: calc(74.999%); } .col-md-10 { width: calc(83.333%); } .col-md-11 { width: calc(91.666%); } .col-md-12 { width: calc(99.999%); }
}
@media (min-width: 992px) {
  .col-lg-1 { width: calc(8.333%); } .col-lg-2 { width: calc(16.666%); } .col-lg-3 { width: calc(24.999%); } .col-lg-4 { width: calc(33.333%); } .col-lg-5 { width: calc(41.666%); } .col-lg-6 { width: calc(49.333%); } .col-lg-7 { width: calc(58.333%); } .col-lg-8 { width: calc(66.666%); } .col-lg-9 { width: calc(74.999%); } .col-lg-10 { width: calc(83.333%); } .col-lg-11 { width: calc(91.666%); } .col-lg-12 { width: calc(99.999%); }
}
@media (min-width: 1200px) {
  .col-xl-1 { width: calc(8.333%); } .col-xl-2 { width: calc(16.666%); } .col-xl-3 { width: calc(24.999%); } .col-xl-4 { width: calc(33.333%); } .col-xl-5 { width: calc(41.666%); } .col-xl-6 { width: calc(49.333%); } .col-xl-7 { width: calc(58.333%); } .col-xl-8 { width: calc(66.666%); } .col-xl-9 { width: calc(74.999%); } .col-xl-10 { width: calc(83.333%); } .col-xl-11 { width: calc(91.666%); } .col-xl-12 { width: calc(99.999%); }
}
EOF

cat > src/css/reportmanager.css << 'EOF'
:root {
    --color-sem-error:   #e53935;
    --color-sem-success: #43a047;
    --color-sem-warning: #f9a825;
    --color-sem-info:    #1e88e5;
}

#notification {
    position: fixed;
    top: 1rem;
    right: 1rem;
    width: 320px;
    z-index: 9999;
    display: flex;
    flex-direction: column;
}

.notification {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: .75rem 1rem;
    margin-bottom: .5rem;
    background: #fff;
    border-radius: 6px;
    box-shadow: 0 8px 20px rgba(0,0,0,.08);
    overflow: hidden;
    opacity: 1;
    transform: translateX(0);
    transition: opacity .25s cubic-bezier(.4,0,.2,1), transform .25s cubic-bezier(.4,0,.2,1);
    animation: notification-in .3s cubic-bezier(.4,0,.2,1);
}

@keyframes notification-in {
    from { opacity: 0; transform: translateX(60px); }
    to { opacity: 1; transform: translateX(0); }
}

.notification.closing { opacity: 0; transform: translateX(60px); }
.notification.collapsing {
    height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    transition: height .25s, margin .25s, padding .25s;
}

.notification-message { flex: 1; font-size: .9rem; color: #333; padding-right: .75rem; }
.notification-close { background: none; border: none; font-size: 1.2rem; cursor: pointer; color: #999; }
.notification-close:hover { color: #000; transform: scale(1.15); }

.notification-error { border-left: 5px solid var(--color-sem-error); }
.notification-success { border-left: 5px solid var(--color-sem-success); }
.notification-warning { border-left: 5px solid var(--color-sem-warning); }
.notification-info { border-left: 5px solid var(--color-sem-info); }
EOF

cat > src/css/classs_style_defauld.css << 'EOF'
@import url(./main.css);

/* Clases utilitarias */
.bg-primario { background-color: var(--color-primario); }
.bg-secundario { background-color: var(--color-secundario); }
.bg-auxiliar { background-color: var(--color-auxiliar); }
.bg-auxiliar-secundario { background-color: var(--color-auxiliar-secundario); }
.bg-complementario { background-color: var(--color-complementario); }
.bg-complementario-secundario { background-color: var(--color-complementario-secundario); }
.bg-matriz { background-color: var(--color-matriz); }
.bg-blanco { background-color: var(--color-blanco); }
.bg-negro { background-color: var(--color-negro); }
.bg-error { background-color: var(--color-sem-error); }
.bg-success { background-color: var(--color-sem-success); }
.bg-warning { background-color: var(--color-sem-warning); }
.bg-info { background-color: var(--color-sem-info); }

.text-primario { color: var(--color-primario); }
.text-secundario { color: var(--color-secundario); }
.text-auxiliar { color: var(--color-auxiliar); }
.text-auxiliar-secundario { color: var(--color-auxiliar-secundario); }
.text-complementario { color: var(--color-complementario); }
.text-complementario-secundario { color: var(--color-complementario-secundario); }
.text-matriz { color: var(--color-matriz); }
.text-blanco { color: var(--color-blanco); }
.text-negro { color: var(--color-negro); }
.text-error { color: var(--color-sem-error); }
.text-success { color: var(--color-sem-success); }
.text-warning { color: var(--color-sem-warning); }
.text-info { color: var(--color-sem-info); }

.text-h1 { font-size: var(--font-size-h1); }
.text-h2 { font-size: var(--font-size-h2); }
.text-h3 { font-size: var(--font-size-h3); }
.text-h4 { font-size: var(--font-size-h4); }
.text-h5 { font-size: var(--font-size-h5); }
.text-h6 { font-size: var(--font-size-h6); }
.text-base { font-size: var(--font-size-texto); }
.text-sm { font-size: var(--font-size-texto-secundario); }
.text-xs { font-size: var(--font-size-texto-pequeño); }

.font-bold { font-weight: 700; }
.font-normal { font-weight: 400; }
.font-semibold { font-weight: 600; }

.p-1 { padding: var(--space-padding-xs); } .p-2 { padding: var(--space-padding-sm); } .p-3 { padding: var(--space-padding-md); } .p-4 { padding: var(--space-padding-lg); } .p-5 { padding: var(--space-padding-xl); }
.px-1 { padding-left: var(--space-padding-xs); padding-right: var(--space-padding-xs); } .px-2 { padding-left: var(--space-padding-sm); padding-right: var(--space-padding-sm); } .px-3 { padding-left: var(--space-padding-md); padding-right: var(--space-padding-md); } .px-4 { padding-left: var(--space-padding-lg); padding-right: var(--space-padding-lg); } .px-5 { padding-left: var(--space-padding-xl); padding-right: var(--space-padding-xl); }
.py-1 { padding-top: var(--space-padding-xs); padding-bottom: var(--space-padding-xs); } .py-2 { padding-top: var(--space-padding-sm); padding-bottom: var(--space-padding-sm); } .py-3 { padding-top: var(--space-padding-md); padding-bottom: var(--space-padding-md); } .py-4 { padding-top: var(--space-padding-lg); padding-bottom: var(--space-padding-lg); } .py-5 { padding-top: var(--space-padding-xl); padding-bottom: var(--space-padding-xl); }
.pt-1 { padding-top: var(--space-padding-xs); } .pt-2 { padding-top: var(--space-padding-sm); } .pt-3 { padding-top: var(--space-padding-md); } .pt-4 { padding-top: var(--space-padding-lg); } .pt-5 { padding-top: var(--space-padding-xl); }
.pb-1 { padding-bottom: var(--space-padding-xs); } .pb-2 { padding-bottom: var(--space-padding-sm); } .pb-3 { padding-bottom: var(--space-padding-md); } .pb-4 { padding-bottom: var(--space-padding-lg); } .pb-5 { padding-bottom: var(--space-padding-xl); }
.pl-1 { padding-left: var(--space-padding-xs); } .pl-2 { padding-left: var(--space-padding-sm); } .pl-3 { padding-left: var(--space-padding-md); } .pl-4 { padding-left: var(--space-padding-lg); } .pl-5 { padding-left: var(--space-padding-xl); }
.pr-1 { padding-right: var(--space-padding-xs); } .pr-2 { padding-right: var(--space-padding-sm); } .pr-3 { padding-right: var(--space-padding-md); } .pr-4 { padding-right: var(--space-padding-lg); } .pr-5 { padding-right: var(--space-padding-xl); }

.gap-1 { gap: var(--space-gap-xs); } .gap-2 { gap: var(--space-gap-sm); } .gap-3 { gap: var(--space-gap-md); } .gap-4 { gap: var(--space-gap-lg); } .gap-5 { gap: var(--space-gap-xl); }

.rounded-1 { border-radius: var(--border-radius-xs); } .rounded-2 { border-radius: var(--border-radius-sm); } .rounded-3 { border-radius: var(--border-radius-md); } .rounded-4 { border-radius: var(--border-radius-lg); } .rounded-5 { border-radius: var(--border-radius-xl); } .rounded-full { border-radius: 9999px; }

.shadow-1 { box-shadow: var(--shadow-xs); } .shadow-2 { box-shadow: var(--shadow-sm); } .shadow-3 { box-shadow: var(--shadow-md); } .shadow-4 { box-shadow: var(--shadow-lg); } .shadow-5 { box-shadow: var(--shadow-xl); }

.flex { display: flex; } .grid { display: grid; } .block { display: block; } .inline-block { display: inline-block; } .hidden { display: none; }
.flex-row { flex-direction: row; } .flex-col { flex-direction: column; } .flex-wrap { flex-wrap: wrap; } .flex-nowrap { flex-wrap: nowrap; }
.justify-start { justify-content: flex-start; } .justify-end { justify-content: flex-end; } .justify-center { justify-content: center; } .justify-between { justify-content: space-between; } .justify-around { justify-content: space-around; } .justify-evenly { justify-content: space-evenly; }
.items-start { align-items: flex-start; } .items-end { align-items: flex-end; } .items-center { align-items: center; } .items-baseline { align-items: baseline; } .items-stretch { align-items: stretch; }

.w-full { width: 100%; } .w-screen { width: 100vw; } .h-full { min-height: 100%; } .h-screen { min-height: 100vh; }
.relative { position: relative; } .absolute { position: absolute; } .fixed { position: fixed; } .sticky { position: sticky; }
.cursor-pointer { cursor: pointer; }
.top-0{ top: 0; } .bottom-0{ bottom: 0; } .right-0{ right: 0; } .left-0{ left: 0; }
EOF

# ========== src/componentes/tarjetas ==========

cat > src/componentes/tarjetas/simple.html << 'EOF'
<div class="col-12">
    <div class="p-2 bg-blanco rounded-3 shadow-3 text-center">
        <h3 class="text-h4 text-primario pb-1">{{titulo}}</h3>
        <p class="text-sm text-complementario pb-3">{{descripcion}}</p>
        <a href="{{enlace}}" class="inline-block p-2 bg-primario text-blanco rounded-2 no-underline">{{textoEnlace}}</a>
    </div>
</div>
EOF

# ========== src/forms ==========

cat > src/forms/login-form.html << 'EOF'
<form onsubmit="return false;" class="fixed top-0 right-0 h-screen w-full flex justify-center items-center bg-primario">
    <div class="col-12 col-sm-8 col-md-6 col-xl-3 mx-3">
        <div class="flex flex-col gap-3 p-5 bg-blanco rounded-3 shadow-3">
            <h1 class="text-h3 font-bold text-negro text-center">Iniciar sesión</h1>
            <div class="flex flex-col gap-1">
                <label class="text-sm text-matriz" for="email">Correo electrónico</label>
                <input id="email" type="email" placeholder="correo@ejemplo.com" required class="p-2 rounded-2 text-base bg-blanco shadow-1" />
            </div>
            <div class="flex flex-col gap-1">
                <label class="text-sm text-matriz" for="password">Contraseña</label>
                <input id="password" type="password" placeholder="Contraseña" required class="p-2 rounded-2 text-base bg-blanco shadow-1" />
            </div>
            <button id="btnEnviar" class="w-full p-2 bg-primario text-blanco rounded-2 font-semibold cursor-pointer shadow-2">Entrar</button>
            <p id="msg" class="text-sm text-error text-center mt-2"></p>
        </div>
    </div>
</form>
EOF

# ========== src/secciones ==========

cat > src/secciones/footer.html << 'EOF'
<footer class="bg-primario p-4">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <p class="text-blanco text-sm">© 2024 Sistema de Gestión. Todos los derechos reservados.</p>
            </div>
        </div>
    </div>
</footer>
EOF

cat > src/secciones/header.html << 'EOF'
<div id="close_menu"></div>
<div id="menu"></div>
<script>
  $(document).ready(function() {
    $('#menu, #close_menu').click(function() {
      $('#sidebar').slideToggle(200);
    });
  });
</script>
EOF

cat > src/secciones/navbar.html << 'EOF'
<nav class="bg-primario p-3 shadow-3">
    <div class="container">
        <div class="row items-center">
            <div class="col-auto">
                <a href="#/" class="text-h4 font-bold text-blanco no-underline">Mi App</a>
            </div>
            <div class="col flex justify-end gap-4">
                <a href="#/productos" class="text-blanco no-underline hover:bg-auxiliar p-2 rounded-2 transition-all">Productos</a>
                <a href="#/clientes" class="text-blanco no-underline hover:bg-auxiliar p-2 rounded-2 transition-all">Clientes</a>
                <a href="#/ventas" class="text-blanco no-underline hover:bg-auxiliar p-2 rounded-2 transition-all">Ventas</a>
                <div class="relative">
                    <button id="userMenu" class="flex items-center gap-2 text-blanco p-2 rounded-2 hover:bg-auxiliar">
                        <span>Usuario</span><span>▼</span>
                    </button>
                    <div id="dropdownMenu" class="absolute right-0 mt-1 bg-blanco rounded-2 shadow-4 min-w-48 hidden">
                        <a href="#/perfil" class="block p-3 text-negro hover:bg-complementario-secundario no-underline">Mi Perfil</a>
                        <a href="#/configuracion" class="block p-3 text-negro hover:bg-complementario-secundario no-underline">Configuración</a>
                        <hr class="border-complementario-secundario">
                        <button id="destroy_sesion" class="w-full text-left p-3 text-error hover:bg-complementario-secundario">Cerrar Sesión</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const userMenu = document.getElementById("userMenu");
        const dropdownMenu = document.getElementById("dropdownMenu");
        if (userMenu && dropdownMenu) {
            userMenu.addEventListener("click", (e) => {
                e.stopPropagation();
                dropdownMenu.classList.toggle("hidden");
            });
            document.addEventListener("click", () => dropdownMenu.classList.add("hidden"));
            dropdownMenu.addEventListener("click", (e) => e.stopPropagation());
        }
    });
</script>
<style>
    .no-underline { text-decoration: none; }
    .transition-all { transition: all 0.3s ease; }
    .min-w-48 { min-width: 12rem; }
    .hidden { display: none; }
</style>
EOF

# ========== views ==========

cat > views/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../src/css/classs_style_defauld.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>Home - Sistema de Productos</title>
</head>
<body class="bg-complementario-secundario min-h-screen">
    <div id="notification"></div>
    <ensamblar src="../src/secciones/navbar.html">Cargando menú...</ensamblar>
    <main class="container mx-auto p-4" id="mainContent">
        <div class="row">
            <div class="col-12">
                <div id="dynamicContent">
                    <div class="text-center py-12">
                        <h1 class="text-h1 text-primario mb-4 animate__animated animate__fadeIn">Bienvenido al Sistema</h1>
                        <p class="text-lg text-complementario mb-8">Selecciona una opción del menú para comenzar</p>
                        <div class="row justify-center gap-4 py-5">
                            <ensamblar class="col-3" src="../src/componentes/tarjetas/simple.html"
                                miken_datos='{"titulo":"Productos","descripcion":"Gestiona tu catálogo","enlace":"#/productos","textoEnlace":"Ir a Productos"}'>
                                Cargando tarjeta...
                            </ensamblar>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <ensamblar src="../src/secciones/footer.html">Cargando pie...</ensamblar>
    <script type="module" src="../miken_clasp/main.js"></script>
</body>
</html>
EOF

cat > views/login.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="../src/css/classs_style_defauld.css">
</head>
<body>
    <div id="notification"></div>
    <ensamblar src="../src/forms/login-form.html">Cargando formulario...</ensamblar>
    <script type="module" src="../miken_clasp/main.js"></script>
    <script type="module">
        import { Sesion } from "../miken_clasp/class/sesion.js";
        document.addEventListener("ensamblar:ready", () => {
            Sesion.init_listen_action_login();
        });
    </script>
</body>
</html>
EOF

cat > views/products/list.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
</head>
<body>
    <div class="container my-4">
        <div class="row justify-between items-center mb-4">
            <h1 class="text-h2">Productos</h1>
            <button id="btnNuevoProducto" class="p-2 bg-primario text-blanco rounded-3 cursor-pointer">+ Nuevo Producto</button>
        </div>
        <div class="row">
            <div class="col-12">
                <div id="loading" class="text-center p-4"><p>Cargando productos...</p></div>
                <div id="productosContainer" class="row gap-3" style="display: none;"></div>
                <div id="noProducts" class="text-center p-4" style="display: none;"><p>No hay productos registrados.</p></div>
            </div>
        </div>
    </div>
    <script type="module">
        import { ProductService } from "../../miken_clasp/services/product.service.js";
        import { Navigate } from "../../miken_clasp/class/navigate.js";
        document.addEventListener("DOMContentLoaded", async () => {
            const productService = new ProductService();
            document.getElementById("btnNuevoProducto").addEventListener("click", () => Navigate.to("/products/create.html"));
            await cargarProductos();
            async function cargarProductos() {
                try {
                    const productos = await productService.getList();
                    if (productos.length === 0) {
                        document.getElementById("loading").style.display = "none";
                        document.getElementById("noProducts").style.display = "block";
                        return;
                    }
                    const container = document.getElementById("productosContainer");
                    container.innerHTML = "";
                    productos.forEach(producto => container.appendChild(crearCard(producto)));
                    document.getElementById("loading").style.display = "none";
                    container.style.display = "flex";
                } catch (error) {
                    globalThis.Report?.addError("Error al cargar productos");
                }
            }
            function crearCard(producto) {
                const div = document.createElement("div");
                div.className = "col-12 col-md-6 col-lg-4";
                div.innerHTML = `
                    <div class="p-3 bg-blanco rounded-3 shadow-2 h-full">
                        <h3 class="text-h4 font-semibold mb-2">${producto.nombre}</h3>
                        <p class="text-lg font-bold text-primario mb-2">$${producto.precio}</p>
                        <p class="text-sm text-complementario mb-3">${producto.descripcion || ''}</p>
                        <div class="flex gap-2 mt-3">
                            <button class="btnEditar p-2 bg-auxiliar text-blanco rounded-2 flex-1 cursor-pointer" data-id="${producto.id}">Editar</button>
                            <button class="btnEliminar p-2 bg-error text-blanco rounded-2 flex-1 cursor-pointer" data-id="${producto.id}">Eliminar</button>
                        </div>
                    </div>
                `;
                div.querySelector(".btnEditar").addEventListener("click", (e) => {
                    Navigate.to(`/products/edit.html?id=${e.target.dataset.id}`);
                });
                div.querySelector(".btnEliminar").addEventListener("click", async (e) => {
                    if (confirm("¿Eliminar?")) {
                        try {
                            await productService.delete(e.target.dataset.id);
                            globalThis.Report.addSuccess("Producto eliminado");
                            await cargarProductos();
                        } catch { globalThis.Report.addError("Error al eliminar"); }
                    }
                });
                return div;
            }
        });
    </script>
</body>
</html>
EOF

cat > views/products/create.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo Producto</title>
</head>
<body>
    <div class="container my-4">
        <div class="row mb-4"><h1 class="text-h2">Nuevo Producto</h1></div>
        <div class="row">
            <div class="col-12 col-md-8 col-lg-6">
                <form id="formProducto" class="flex flex-col gap-3 p-4 bg-blanco rounded-3 shadow-3">
                    <div class="flex flex-col gap-1">
                        <label class="text-sm text-matriz font-semibold">Nombre *</label>
                        <input type="text" id="nombre" name="nombre" required class="p-2 rounded-2 border border-complementario-secundario">
                    </div>
                    <div class="flex flex-col gap-1">
                        <label class="text-sm text-matriz font-semibold">Precio *</label>
                        <input type="number" id="precio" name="precio" step="0.01" required class="p-2 rounded-2 border border-complementario-secundario">
                    </div>
                    <div class="flex flex-col gap-1">
                        <label class="text-sm text-matriz font-semibold">Descripción</label>
                        <textarea id="descripcion" name="descripcion" rows="3" class="p-2 rounded-2 border border-complementario-secundario"></textarea>
                    </div>
                    <div class="flex gap-3 mt-4">
                        <button type="submit" class="p-2 bg-primario text-blanco rounded-2 flex-1 cursor-pointer">Guardar</button>
                        <button type="button" id="btnCancelar" class="p-2 bg-complementario-secundario text-negro rounded-2 flex-1 cursor-pointer">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="module">
        import { ProductService } from "../../miken_clasp/services/product.service.js";
        import { Navigate } from "../../miken_clasp/class/navigate.js";
        document.addEventListener("DOMContentLoaded", () => {
            const productService = new ProductService();
            document.getElementById("btnCancelar").addEventListener("click", () => Navigate.to("/products/list.html"));
            document.getElementById("formProducto").addEventListener("submit", async (e) => {
                e.preventDefault();
                try {
                    const producto = {
                        nombre: document.getElementById("nombre").value,
                        precio: document.getElementById("precio").value,
                        descripcion: document.getElementById("descripcion").value
                    };
                    await productService.create(producto);
                    globalThis.Report.addSuccess("Producto creado");
                    Navigate.to("/products/list.html");
                } catch (error) {
                    globalThis.Report.addError("Error al crear");
                }
            });
        });
    </script>
</body>
</html>
EOF

cat > views/products/edit.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>
</head>
<body>
    <div class="container my-4">
        <div class="row mb-4"><h1 class="text-h2">Editar Producto</h1></div>
        <div class="row">
            <div class="col-12 col-md-8 col-lg-6">
                <form id="formProducto" class="flex flex-col gap-3 p-4 bg-blanco rounded-3 shadow-3">
                    <input type="hidden" id="id_product" name="id_product">
                    <div class="flex flex-col gap-1">
                        <label class="text-sm text-matriz font-semibold">Nombre *</label>
                        <input type="text" id="nombre" name="nombre" required class="p-2 rounded-2 border border-complementario-secundario">
                    </div>
                    <div class="flex flex-col gap-1">
                        <label class="text-sm text-matriz font-semibold">Precio *</label>
                        <input type="number" id="precio" name="precio" step="0.01" required class="p-2 rounded-2 border border-complementario-secundario">
                    </div>
                    <div class="flex flex-col gap-1">
                        <label class="text-sm text-matriz font-semibold">Descripción</label>
                        <textarea id="descripcion" name="descripcion" rows="3" class="p-2 rounded-2 border border-complementario-secundario"></textarea>
                    </div>
                    <div class="flex gap-3 mt-4">
                        <button type="submit" class="p-2 bg-primario text-blanco rounded-2 flex-1 cursor-pointer">Actualizar</button>
                        <button type="button" id="btnCancelar" class="p-2 bg-complementario-secundario text-negro rounded-2 flex-1 cursor-pointer">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="module">
        import { ProductService } from "../../miken_clasp/services/product.service.js";
        import { Navigate } from "../../miken_clasp/class/navigate.js";
        document.addEventListener("DOMContentLoaded", async () => {
            const productService = new ProductService();
            const urlParams = new URLSearchParams(window.location.search);
            const id = urlParams.get('id');
            if (!id) { Navigate.to("/products/list.html"); return; }
            try {
                const producto = await productService.getById(id);
                document.getElementById("id_product").value = producto.id;
                document.getElementById("nombre").value = producto.nombre || '';
                document.getElementById("precio").value = producto.precio || '';
                document.getElementById("descripcion").value = producto.descripcion || '';
            } catch { globalThis.Report.addError("Producto no encontrado"); Navigate.to("/products/list.html"); }
            document.getElementById("btnCancelar").addEventListener("click", () => Navigate.to("/products/list.html"));
            document.getElementById("formProducto").addEventListener("submit", async (e) => {
                e.preventDefault();
                try {
                    const producto = {
                        id_product: document.getElementById("id_product").value,
                        nombre: document.getElementById("nombre").value,
                        precio: document.getElementById("precio").value,
                        descripcion: document.getElementById("descripcion").value
                    };
                    await productService.update(producto);
                    globalThis.Report.addSuccess("Producto actualizado");
                    Navigate.to("/products/list.html");
                } catch { globalThis.Report.addError("Error al actualizar"); }
            });
        });
    </script>
</body>
</html>
EOF

# ========== miken_clasp/class ==========

cat > miken_clasp/class/crud.js << 'EOF'
export class Crud {
    constructor({ columnas=[], hoja="default" }) {
        this.columnas = columnas;
        this.hoja = hoja;
    }
}
EOF

cat > miken_clasp/class/navigate.js << 'EOF'
import { PROYECT_NAME } from "../env.js";

export class Navigate {
    static NAME_APP = PROYECT_NAME ? "/"+PROYECT_NAME+"/views" : "";

    static PATHS = {
        LOGIN: "/login.html",
        HOME: "/index.html",
        PRODUCTOS: "/products/list.html",
        PRODUCTO_NUEVO: "/products/create.html",
        PRODUCTO_EDITAR: "/products/edit.html",
        PERFIL: "/perfil/index.html",
        CONFIGURACION: "/configuracion/index.html"
    };

    static isGithubPages() { return window.location.hostname.includes("github.io"); }
    static getBaseRepo() {
        if (!this.isGithubPages()) return "";
        const parts = window.location.pathname.split("/");
        const repo = parts[1] || "";
        return repo ? "/" + repo : "";
    }
    static getFullBase() { return this.getBaseRepo() + this.NAME_APP; }
    static getFullPaths() {
        const base = this.getFullBase();
        const fullPaths = {};
        for (const [key, path] of Object.entries(this.PATHS))
            fullPaths[key] = base + (path.startsWith("/") ? path : "/" + path);
        return fullPaths;
    }
    static getCurrentRoute() { return window.location.pathname.replace(this.getFullBase(), "") || "/"; }
    static to(route) {
        const base = this.getFullBase();
        const clean = route.startsWith("/") ? route : "/" + route;
        if (clean.startsWith("#")) { window.location.hash = clean; return; }
        window.location.href = base + clean;
    }
    static here_is(route) { return this.getCurrentRoute() === route || this.getCurrentRoute() === route + ".html"; }
    static here_not_is(route) { return !this.here_is(route); }
    static toWithParams(baseRoute, params = {}) {
        const qs = new URLSearchParams(params).toString();
        this.to(`${baseRoute}${qs ? '?'+qs : ''}`);
    }
    static getUrlParams() { return new URLSearchParams(window.location.search); }
}
EOF

cat > miken_clasp/class/ReportManager.js << 'EOF'
import { KEY_CACHE_REPORT_ERROR, KEY_CACHE_REPORT_INFO, KEY_CACHE_REPORT_WARNING, KEY_CACHE_REPORT_SUCCESS } from "../env.js";

export class ReportManager {
    static LIMIT = 3;
    static KEYS = {
        error:   KEY_CACHE_REPORT_ERROR,
        info:    KEY_CACHE_REPORT_INFO,
        warning: KEY_CACHE_REPORT_WARNING,
        success: KEY_CACHE_REPORT_SUCCESS,
    };

    constructor() { this.processAll(); }

    addError(mensaje)   { this.add("error", mensaje); }
    addInfo(mensaje)    { this.add("info", mensaje); }
    addWarning(mensaje) { this.add("warning", mensaje); }
    addSuccess(mensaje) { this.add("success", mensaje); }

    add(tipo, mensaje, reload=false) {
        const list = this.getList(tipo);
        const item = { id: this.generateId(), tipo, mensaje };
        if (list.length >= ReportManager.LIMIT) {
            const removed = list.shift();
            this.closeMessage(removed.id, removed.tipo);
        }
        list.push(item);
        this.saveList(tipo, list);
        if (!reload) this.renderItem(item);
        else window.location.reload();
    }

    getList(tipo) { return JSON.parse(localStorage.getItem(ReportManager.KEYS[tipo]) || '[]'); }
    saveList(tipo, list) { localStorage.setItem(ReportManager.KEYS[tipo], JSON.stringify(list)); }
    removeById(tipo, id) { this.saveList(tipo, this.getList(tipo).filter(i => i.id !== id)); }

    renderItem(item) {
        const container = document.getElementById("notification");
        if (container) container.appendChild(this.createNode(item));
    }

    processAll() {
        const container = document.getElementById("notification");
        if (!container) return;
        ["error","info","warning","success"].forEach(tipo => {
            this.getList(tipo).forEach(item => container.appendChild(this.createNode(item)));
        });
    }

    createNode(item) {
        const div = document.createElement("div");
        div.className = `notification notification-${item.tipo}`;
        div.dataset.id = item.id;
        div.innerHTML = `<span class="notification-message">${item.mensaje}</span><button class="notification-close">×</button>`;
        div.querySelector(".notification-close").addEventListener("click", () => this.closeMessage(item.id, item.tipo));
        return div;
    }

    closeMessage(id, tipo) {
        this.removeById(tipo, id);
        const el = document.querySelector(`.notification[data-id="${id}"]`);
        if (!el) return;
        const height = el.offsetHeight;
        el.style.height = `${height}px`;
        el.getBoundingClientRect();
        el.classList.add("closing");
        el.addEventListener("transitionend", () => {
            el.classList.add("collapsing");
            el.addEventListener("transitionend", () => el.remove(), { once: true });
        }, { once: true });
    }

    generateId() { return `${Date.now()}-${Math.random().toString(36).slice(2,8)}`; }
}
EOF

cat > miken_clasp/class/sesion.js << 'EOF'
import { KEY_CACHE_EMAIL, KEY_CACHE_TOKEN } from "../env.js";
import { Navigate } from "./navigate.js";
import { loginAutenticacion } from "../utils/autenticacion.js";

export class Sesion {
    static token = null;
    static email = null;

    constructor() { this.checkSession(); this.init_listen_action_logout(); }

    checkSession() {
        const token = localStorage.getItem(KEY_CACHE_TOKEN);
        const email = localStorage.getItem(KEY_CACHE_EMAIL);
        if (!token || !email) {
            if (Navigate.here_not_is(Navigate.PATHS.LOGIN)) Navigate.to(Navigate.PATHS.LOGIN);
            return false;
        }
        Sesion.token = token;
        Sesion.email = email;
        if (Navigate.here_is(Navigate.PATHS.LOGIN)) Navigate.to(Navigate.PATHS.HOME);
        return true;
    }

    static init_listen_action_login() {
        const btn = document.getElementById("btnEnviar");
        if (btn) {
            btn.addEventListener("click", async () => {
                const email = document.getElementById("email").value;
                const password = document.getElementById("password").value;
                const result = await loginAutenticacion(email, password);
                if (result.success) {
                    globalThis.Report.addSuccess("Sesión iniciada");
                    window.location.reload();
                } else {
                    globalThis.Report.addError(result.error || "Error en login");
                }
            });
        }
    }

    init_listen_action_logout() {
        const btn = document.getElementById("destroy_sesion");
        if (btn) {
            btn.addEventListener("click", () => {
                localStorage.removeItem(KEY_CACHE_EMAIL);
                localStorage.removeItem(KEY_CACHE_TOKEN);
                Sesion.token = null;
                Sesion.email = null;
                Navigate.to(Navigate.PATHS.LOGIN);
            });
        }
    }
}
EOF

# ========== miken_clasp/services ==========

cat > miken_clasp/services/product.service.js << 'EOF'
import { Crud } from "../class/crud.js";
import { URL_API } from "../env.js";
import { Sesion } from "../class/sesion.js";

export class ProductService extends Crud {
    constructor() { super({ columnas: ["id","nombre","precio","descripcion"] }); }

    async request(action, data = {}) {
        const token = Sesion.token;
        if (!token) throw new Error("No hay sesión activa");
        const res = await fetch(URL_API, {
            method: "POST",
            body: JSON.stringify({ action, token, ...data })
        });
        return await res.json();
    }

    async getList() {
        const res = await this.request("list", { tableName: "Productos" });
        if (res.success) return res.records;
        throw new Error(res.error);
    }

    async getById(id) {
        const res = await this.request("get", { tableName: "Productos", id });
        if (res.success) return res.record;
        throw new Error(res.error);
    }

    async create(producto) {
        const res = await this.request("insert", { tableName: "Productos", record: producto });
        if (res.success) return res;
        throw new Error(res.error);
    }

    async update(producto) {
        const res = await this.request("update", { tableName: "Productos", id: producto.id_product, data: producto });
        if (res.success) return res;
        throw new Error(res.error);
    }

    async delete(id) {
        const res = await this.request("delete", { tableName: "Productos", id });
        if (res.success) return res;
        throw new Error(res.error);
    }
}
EOF

# ========== miken_clasp/utils ==========

cat > miken_clasp/utils/autenticacion.js << 'EOF'
import { URL_API, KEY_CACHE_EMAIL, KEY_CACHE_TOKEN } from "../env.js";

async function generarHash(password, salt) {
    const encoder = new TextEncoder();
    const keyMaterial = await crypto.subtle.importKey("raw", encoder.encode(password), "PBKDF2", false, ["deriveBits","deriveKey"]);
    const key = await crypto.subtle.deriveKey(
        { name: "PBKDF2", salt: encoder.encode(salt), iterations: 150000, hash: "SHA-256" },
        keyMaterial, { name: "AES-GCM", length: 256 }, true, ["encrypt","decrypt"]
    );
    const rawKey = await crypto.subtle.exportKey("raw", key);
    return btoa(String.fromCharCode(...new Uint8Array(rawKey)));
}

export async function loginAutenticacion(email, password) {
    const hash = await generarHash(password, email);
    const res = await fetch(URL_API, {
        method: "POST",
        body: JSON.stringify({ action: "login", email, password: hash }) // o enviar password en texto plano? Depende del backend
    });
    const json = await res.json();
    if (json.success === true) {
        localStorage.setItem(KEY_CACHE_EMAIL, email);
        localStorage.setItem(KEY_CACHE_TOKEN, json.token);
        return { success: true, token: json.token };
    }
    return { success: false, error: json.error };
}
EOF

cat > miken_clasp/utils/TemplateEngenie.js << 'EOF'
import { Navigate } from "../class/navigate.js";

export class TemplateEngine {
    constructor(context=null, html=null) {
        this.context = context || {};
        this.html = html || document.documentElement.innerHTML;
    }

    async AsyncProcesarRutesNavigation() {
        const regex = /\{\{url-([^\}]+)\}\}/g;
        const context = Navigate.getFullPaths();
        this.html = this.html.replace(regex, (match, key) => context[key] || "");
        document.documentElement.innerHTML = this.html;
    }
}
EOF

# ========== miken_clasp/env.js ==========

cat > miken_clasp/env.js << 'EOF'
export const URL_API = "https://script.google.com/macros/s/AKfycbxxxxxxxxxxxx/exec"; // REEMPLAZAR CON TU URL
export const PROYECT_NAME = ""; // Vacío si los HTML están en raíz, o nombre del repo si en subcarpeta

export const KEY_CACHE_EMAIL = "out_email";
export const KEY_CACHE_TOKEN = "out_token";
export const KEY_CACHE_REPORT_ERROR = "KEY_CACHE_REPORT_ERROR";
export const KEY_CACHE_REPORT_INFO = "KEY_CACHE_REPORT_INFO";
export const KEY_CACHE_REPORT_WARNING = "KEY_CACHE_REPORT_WARNING";
export const KEY_CACHE_REPORT_SUCCESS = "KEY_CACHE_REPORT_SUCCESS";
EOF

# ========== miken_clasp/main.js ==========

cat > miken_clasp/main.js << 'EOF'
import { Sesion } from "./class/sesion.js";
import { ReportManager } from "./class/ReportManager.js";
import { TemplateEngine } from "./utils/TemplateEngenie.js";

document.addEventListener("DOMContentLoaded", async () => {
    await cargarComponentes();
    const templateengine = new TemplateEngine();
    await templateengine.AsyncProcesarRutesNavigation();
    globalThis.Report = new ReportManager();
    document.dispatchEvent(new CustomEvent("ensamblar:ready"));
    new Sesion();
});

async function cargarComponentes() {
    const tags = document.getElementsByTagName("ensamblar");
    for (let tag of Array.from(tags)) await procesarComponente(tag);
}

async function procesarComponente(tag) {
    const src = tag.getAttribute("src");
    if (!src) return;
    try {
        const resp = await fetch(src);
        let html = await resp.text();
        const mikenDatos = tag.getAttribute("miken_datos");
        if (mikenDatos) {
            try {
                const datos = eval(`(${mikenDatos})`);
                html = html.replace(/\{\{(\w+)\}\}/g, (_, clave) => datos[clave] !== undefined ? datos[clave] : _);
            } catch (e) { console.warn("Error en miken_datos", e); }
        }
        tag.innerHTML = html;
        // Ejecutar scripts insertados
        tag.querySelectorAll("script").forEach(oldScript => {
            const newScript = document.createElement("script");
            if (oldScript.src) newScript.src = oldScript.src;
            else newScript.textContent = oldScript.textContent;
            if (oldScript.type === "module") newScript.type = "module";
            document.body.appendChild(newScript);
            oldScript.remove();
        });
    } catch (error) {
        tag.innerHTML = `<p class="text-error">Error cargando ${src}</p>`;
    }
}
EOF

# ========== miken_clasp/promocion/index.html ==========

cat > miken_clasp/promocion/index.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Login promoción</title></head>
<body>
    <h2>Login</h2>
    <input type="email" id="email" placeholder="Correo">
    <input type="password" id="password" placeholder="Contraseña">
    <button id="btnEnviar">Enviar</button>
    <p id="msg"></p>
    <script type="module">
        import { loginAutenticacion } from "../utils/autenticacion.js";
        document.getElementById("btnEnviar").addEventListener("click", async () => {
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;
            const auth = await loginAutenticacion(email, password);
            document.getElementById("msg").textContent = auth.success ? "OK" : "Error";
        });
    </script>
</body>
</html>
EOF

# ========== 01_Documentacion ==========

cat > 01_Documentacion/clasp.md << 'EOF'
# Notas sobre clasp
...
EOF

cat > 01_Documentacion/miken_clasp.md << 'EOF'
# Documentación del frontend
...
EOF

echo "✅ Todos los archivos creados correctamente."
echo ""
echo "📌 Próximos pasos:"
echo "1. Reemplaza la URL en miken_clasp/env.js con la de tu backend de Apps Script."
echo "2. Ajusta PROYECT_NAME en env.js si tu repositorio tiene un nombre y los HTML están en /nombre-repo/views/."
echo "3. Despliega en GitHub Pages desde la rama main (carpeta raíz)."
echo "4. Asegúrate de que el backend de Apps Script esté desplegado y permita CORS."
echo ""
echo "🎯 ¡Disfruta tu sistema!"