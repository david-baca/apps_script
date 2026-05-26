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
