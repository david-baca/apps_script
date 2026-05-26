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
