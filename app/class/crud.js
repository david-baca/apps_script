import { KEY_CACHE_EMAIL } from "../env.js";

export class Crud {
    // Propiedades estáticas compartidas por TODAS las instancias CRUD
    static columnas = [];

    constructor({ columnas=[], hoja="defauld", archivo="defauld" }) {
        this.columnas = columnas;
        this.hoja = hoja
        this.archivo = archivo;
    }

    static get(){

    }



    
}
