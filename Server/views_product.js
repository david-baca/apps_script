function getList_product() {

  const ss = SpreadsheetApp.openById(FILE_SHEET_ID);
  const sheet = getSheet(ss, "Productos");

  const data = sheet.getDataRange().getValues();
  const headers = data[0];
  const rows = data.slice(1);

  const productos = rows.map(row => {
    let obj = {};
    headers.forEach((k, i) => obj[k] = row[i]);
    return obj;
  });

  return ({ status: true, code: 200, data: productos });
}


function getByID_product(data) {

  const id = data.id_product;
  if (!id) return ({ status: false, code: 400, message: "id_product es requerido" });

  const ss = SpreadsheetApp.openById(FILE_SHEET_ID);
  const sheet = getSheet(ss, "Productos");

  const { rowIndex, data: row } = findToSheet(sheet, id, 0);

  if (!rowIndex) {
    return ({ status: false, code: 404, message: "Producto no encontrado" });
  }

  const headers = sheet.getDataRange().getValues()[0];
  const result = {};

  headers.forEach((h, i) => result[h] = row[i]);

  return ({ status: true, code: 200, data: result });
}


function post_product(data) {

  const nombre = data.nombre;
  const precio = data.precio;
  const imgBase64 = data.imgBase64;
  const mimeType = data.mimeType;

  if (!nombre) return ({ status: false, code: 400, message: "nombre es requerido" });
  if (!precio) return ({ status: false, code: 400, message: "precio es requerido" });

  if (
    (imgBase64 && !mimeType) ||
    (!imgBase64 && mimeType)
  ) {
    return {
      status: false,
      code: 400,
      message: "Para subir una imagen debes enviar base64 y mimeType juntos, o no enviar ninguno"
    };
  }

  const estado_bucket = subirImagenADrive(imgBase64, mimeType)

  if ( !estado_bucket.ok) { return { status: false, code:500, message: estado_bucket.error } }

  const ss = SpreadsheetApp.openById(FILE_SHEET_ID);
  const sheet = getSheet(ss, "Productos");

  const id = generacion_id("PROD");

  sheet.appendRow([
    id,
    nombre,
    precio,
    data.descripcion || "",
    data.imagen || "",
    data.frame || ""
  ]);

  return ({ status: true, code: 200, message: "Producto creado", id: id });
}


function put_product(data) {

  const id = data.id_product;
  if (!id) return ({ status: false, code: 400, message: "id_product es requerido" });

  const nombre = data.nombre_product;
  const precio = data.precio_product;

  if (!nombre) return ({ status: false, code: 400, message: "nombre_product es requerido" });
  if (!precio) return ({ status: false, code: 400, message: "precio_product es requerido" });

  const ss = SpreadsheetApp.openById(FILE_SHEET_ID);
  const sheet = getSheet(ss, "Productos");

  const { rowIndex } = findToSheet(sheet, id);

  if (!rowIndex) {
    return ({ status: false, code: 404, message: "Producto no encontrado" });
  }

  sheet.getRange(rowIndex, 2).setValue(nombre);
  sheet.getRange(rowIndex, 3).setValue(precio);
  sheet.getRange(rowIndex, 4).setValue(data.descripcion || "");
  sheet.getRange(rowIndex, 5).setValue(data.imagen || "");
  sheet.getRange(rowIndex, 6).setValue(data.frame || "");

  return ({ status: true, code: 200, message: "Producto actualizado" });
}


function delete_product(data) {

  const id = data.id_product;
  if (!id) return ({ status: false, code: 400, message: "id_product es requerido" });

  const ss = SpreadsheetApp.openById(FILE_SHEET_ID);
  const sheet = getSheet(ss, "Productos");

  const { rowIndex } = findToSheet(sheet, id);

  if (!rowIndex) {
    return ({ status: false, code: 404, message: "Producto no encontrado" });
  }

  sheet.deleteRow(rowIndex);

  return ({ status: true, code: 200, message: "Producto eliminado" });
}

