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
