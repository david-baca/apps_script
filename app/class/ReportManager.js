import {
    KEY_CACHE_REPORT_ERROR,
    KEY_CACHE_REPORT_INFO,
    KEY_CACHE_REPORT_WARNING,
    KEY_CACHE_REPORT_SUCCESS
} from "../env.js";

export class ReportManager {

    static LIMIT = 3;

    static KEYS = {
        error:   KEY_CACHE_REPORT_ERROR,
        info:    KEY_CACHE_REPORT_INFO,
        warning: KEY_CACHE_REPORT_WARNING,
        success: KEY_CACHE_REPORT_SUCCESS,
    };

    constructor() {
        this.processAll();
    }

    // =========================
    // API PÚBLICA
    // =========================
    addError(mensaje)   { this.add("error", mensaje); }
    addInfo(mensaje)    { this.add("info", mensaje); }
    addWarning(mensaje) { this.add("warning", mensaje); }
    addSuccess(mensaje) { this.add("success", mensaje); }

    addError_reload(mensaje)   { this.add("error", mensaje, true); }
    addInfo_reload(mensaje)    { this.add("info", mensaje, true); }
    addWarning_reload(mensaje) { this.add("warning", mensaje, true); }
    addSuccess_reload(mensaje) { this.add("success", mensaje, true); }

    // =========================
    // CORE
    // =========================
    add(tipo, mensaje, reloat=false) {
        const list = this.getList(tipo);

        const item = {
            id: this.generateId(),
            tipo,
            mensaje
        };

        // 👉 overflow → cerrar el más antiguo con animación
        if (list.length >= ReportManager.LIMIT) {
            const removed = list.shift();
            this.closeMessage(removed.id, removed.tipo);
        }

        list.push(item);
        this.saveList(tipo, list);

        if (!reloat){
            this.renderItem(item);
        }else{
            window.location.reload();
        }
    }

    // =========================
    // PERSISTENCIA
    // =========================
    getList(tipo) {
        const raw = localStorage.getItem(ReportManager.KEYS[tipo]);
        return raw ? JSON.parse(raw) : [];
    }

    saveList(tipo, list) {
        localStorage.setItem(
            ReportManager.KEYS[tipo],
            JSON.stringify(list)
        );
    }

    removeById(tipo, id) {
        const list = this.getList(tipo).filter(i => i.id !== id);
        this.saveList(tipo, list);
    }

    // =========================
    // RENDER
    // =========================
    renderItem(item) {
        const container = document.getElementById("notification");
        if (!container) return;

        container.appendChild(this.createNode(item));
    }

    processAll() {
        const container = document.getElementById("notification");
        if (!container) return;
        ["error", "info", "warning", "success"].forEach(tipo => {
            this.getList(tipo).forEach(item => {
                container.appendChild(this.createNode(item));
            });
        });
    }

    createNode(item) {
        const div = document.createElement("div");

        div.className = `notification notification-${item.tipo}`;
        div.dataset.id = item.id;

        div.innerHTML = `
            <span class="notification-message">${item.mensaje}</span>
            <button class="notification-close">×</button>
        `;

        div.querySelector(".notification-close")
            .addEventListener("click", () => {
                this.closeMessage(item.id, item.tipo);
            });

        return div;
    }

    // =========================
    // CIERRE UNIFICADO (CLAVE)
    // =========================
    closeMessage(id, tipo) {
        const el = document.querySelector(
            `.notification[data-id="${id}"]`
        );

        // siempre limpiar cache
        this.removeById(tipo, id);

        if (!el) return;

        // medir altura ANTES
        const height = el.offsetHeight;

        // fijar altura actual (clave)
        el.style.height = `${height}px`;

        // forzar reflow
        el.getBoundingClientRect();

        // FASE 1 → salida lateral
        el.classList.add("closing");

        // cuando termine la salida lateral
        el.addEventListener("transitionend", () => {

            // FASE 2 → colapso vertical
            el.classList.add("collapsing");

            el.addEventListener("transitionend", () => {
                el.remove();
            }, { once: true });

        }, { once: true });
    }


    // =========================
    // UTILS
    // =========================
    generateId() {
        return `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;
    }
}
