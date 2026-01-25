import { Crud } from "../class/crud.js";
import { URL_DATA } from "../env.js";

export class ProductService extends Crud {
    constructor() {
        super({
            columnas: ["id_product", "nombre", "precio", "descripcion", "imagen", "frame"],
            hoja: "Productos",
            archivo: "URL_PRINCIPAL" // Definir en env.js
        });
    }
    
    async getList() {
        try {
            const response = await fetch(URL_DATA, {
                method: "POST",
                body: JSON.stringify({
                    action: "getList_product",
                    email: localStorage.getItem("out_email_defensajuridica_mx_sistema_miken"),
                    hash: localStorage.getItem("out_pass_defensajuridica_mx_sistema_miken")
                })
            });
            
            const data = await response.json();
            
            if (data.status) {
                return data.data;
            } else {
                throw new Error(data.message || "Error al obtener productos");
            }
            
        } catch (error) {
            console.error("Error en getList:", error);
            throw error;
        }
    }
    
    async getById(id) {
        try {
            const response = await fetch(URL_DATA, {
                method: "POST",
                body: JSON.stringify({
                    action: "getByID_product",
                    id_product: id,
                    email: localStorage.getItem("out_email_defensajuridica_mx_sistema_miken"),
                    hash: localStorage.getItem("out_pass_defensajuridica_mx_sistema_miken")
                })
            });
            
            const data = await response.json();
            
            if (data.status) {
                return data.data;
            } else {
                throw new Error(data.message || "Producto no encontrado");
            }
            
        } catch (error) {
            console.error("Error en getById:", error);
            throw error;
        }
    }
    
    async create(producto) {
        try {
            const response = await fetch(URL_DATA, {
                method: "POST",
                body: JSON.stringify({
                    action: "post_product",
                    ...producto,
                    email: localStorage.getItem("out_email_defensajuridica_mx_sistema_miken"),
                    hash: localStorage.getItem("out_pass_defensajuridica_mx_sistema_miken")
                })
            });
            
            const data = await response.json();
            
            if (data.status) {
                return data;
            } else {
                throw new Error(data.message || "Error al crear producto");
            }
            
        } catch (error) {
            console.error("Error en create:", error);
            throw error;
        }
    }
    
    async update(producto) {
        try {
            const response = await fetch(URL_DATA, {
                method: "POST",
                body: JSON.stringify({
                    action: "put_product",
                    id_product: producto.id_product,
                    nombre_product: producto.nombre,
                    precio_product: producto.precio,
                    descripcion: producto.descripcion,
                    imgBase64: producto.imgBase64,
                    mimeType: producto.mimeType,
                    email: localStorage.getItem("out_email_defensajuridica_mx_sistema_miken"),
                    hash: localStorage.getItem("out_pass_defensajuridica_mx_sistema_miken")
                })
            });
            
            const data = await response.json();
            
            if (data.status) {
                return data;
            } else {
                throw new Error(data.message || "Error al actualizar producto");
            }
            
        } catch (error) {
            console.error("Error en update:", error);
            throw error;
        }
    }
    
    async delete(id) {
        try {
            const response = await fetch(URL_DATA, {
                method: "POST",
                body: JSON.stringify({
                    action: "delete_product",
                    id_product: id,
                    email: localStorage.getItem("out_email_defensajuridica_mx_sistema_miken"),
                    hash: localStorage.getItem("out_pass_defensajuridica_mx_sistema_miken")
                })
            });
            
            const data = await response.json();
            
            if (data.status) {
                return data;
            } else {
                throw new Error(data.message || "Error al eliminar producto");
            }
            
        } catch (error) {
            console.error("Error en delete:", error);
            throw error;
        }
    }
}