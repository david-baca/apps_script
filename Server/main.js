const FILE_SHEET_ID = "1dBKZ36ucbUcqGNpC4nJX4V1y_hvStA10Yz7nLvBY3qA"
const BUCKET_ID = "1GaqhVp5f4ESOJx1ohz6qoDx1uqG1MBV9"

function doPost(e) {
  try {

    if (!e || !e.postData || !e.postData.contents) {
      return respond({ status: false, code: 400, message: "POST vacío o inválido" });
    }

    const data = JSON.parse(e.postData.contents);
    sesion = outh(data);

    // si por alguna razon sesion fallo mandar la resuesta de sesion.
    if(sesion.status === false){respond(sesion)}

    // si no se espesifico la accion definirle accion requerida
    if (!data.action) {
      return respond({ status: false, code: 400, message: "action es requerido" });
    }

    // VIEW SESION

    if (data.action === "outh") return respond(sesion);
    if (data.action === "change_password") return respond( change_password(data) );

    // VIEW PRODUCT

    if (data.action === "getList_product") return respond( getList_product(data) );
    if (data.action === "getByID_product") return respond( getByID_product(data) );
    if (data.action === "post_product") return respond( post_product(data) );
    if (data.action === "put_product") return respond( put_product(data) );
    if (data.action === "delete_product") return respond( delete_product(data) );


    return respond({ status: false, code: 400, message: "Método no reconocido" });

  } catch (err) {
    return respond({ status: false, code: 505, message: err.toString()+sesion });
  }
}