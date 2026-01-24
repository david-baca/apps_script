/* -------------------------
   Utilidades
------------------------- */

function generacion_id(name_section) {
  const now = new Date();
  return `${name_section}_${now.getTime()}`;
}

function outh(data) {
  const email = data.email;
  const hash = data.hash;

  if (!email) return ({ status: false, code: 400, message: "email es requerido" });
  if (!hash) return ({ status: false, code: 400, message: "hash es requerido" });

  if (!authenticate(email, hash)) {
    return ({ status: false, code: 403, message: "No autorizado" });
  }
  return ({ status:true, code: 200, message: "Sesion Autorizada" });
}


function authenticate(email, hash) {
  const ss = SpreadsheetApp.openById(FILE_SHEET_ID);
  const sheetPass = getSheet(ss, "pass_secret");

  const { rowIndex, data } = findToSheet(sheetPass, email);
  if (!rowIndex) return false;

  return data[1] === hash ? rowIndex : false;
}


function getSheet(ss, name) {
  const sheet = ss.getSheetByName(name);
  if (!sheet) throw new Error("No existe la hoja: " + name);
  return sheet;
}


function findToSheet(sheet, buscar, col = 0, in_contains = false) {
  const rows = sheet.getDataRange().getValues();
  const found = [];

  for (let i = 1; i < rows.length; i++) {
    const cell = rows[i][col];

    if (!in_contains && cell === buscar) {
      return { rowIndex: i + 1, data: rows[i] };
    }

    if (in_contains && typeof cell === "string" && cell.includes(buscar)) {
      found.push({ rowIndex: i + 1, data: rows[i] });
    }
  }

  if (in_contains) return { rowIndex: false, data: found };

  return { rowIndex: false, data: false };
}


function subirImagenADrive(base64, mimeType) {
  try {
    // Validaciones mínimas
    if (!base64) {
      throw new Error('Base64 vacío o no enviado');
    }

    if (!mimeType || !mimeType.startsWith('image/')) {
      throw new Error('MIME type inválido: ' + mimeType);
    }

    const carpetaId = BUCKET_ID;
    if (!carpetaId) {
      throw new Error('BUCKET_ID no definido');
    }

    // Decodificación
    const bytes = Utilities.base64Decode(base64);
    if (!bytes || !bytes.length) {
      throw new Error('No se pudieron decodificar los bytes');
    }

    // Nombre único
    const ahora = new Date();
    const fecha = Utilities.formatDate(
      ahora,
      Session.getScriptTimeZone(),
      'yyyyMMdd_HHmmss_SSS'
    );

    const extension = mimeType.split('/')[1];
    const nombreArchivo = `img_${fecha}.${extension}`;

    // Crear blob
    const blob = Utilities.newBlob(bytes, mimeType, nombreArchivo);

    // Guardar en Drive
    const carpeta = DriveApp.getFolderById(carpetaId);
    const archivo = carpeta.createFile(blob);

    // OK
    return {
      ok: true,
      id: archivo.getId(),
      url: archivo.getUrl(),
      nombre: archivo.getName(),
      mimeType: archivo.getMimeType()
    };

  } catch (error) {
    // Error controlado (NO rompe el WebApp)
    Logger.log('Error subirImagenADrive: ' + error.message);

    return {
      ok: false,
      error: error.message
    };
  }
}



function respond(obj) {
  return ContentService
    .createTextOutput(JSON.stringify(obj))
    .setMimeType(ContentService.MimeType.JSON);
}
