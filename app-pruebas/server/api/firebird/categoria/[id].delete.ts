import { withConnection } from "../../../utils/firebird/firebird";

export default defineEventHandler(async (event) => {
  try {
    const id = event.context.params.id;

    if (!id) {
      return { statusCode: 400, message: "ID es obligatorio" };
    }

    const db: any = await withConnection();

    const result = await new Promise((resolve, reject) => {
      db.query("DELETE FROM CATEGORIAS WHERE ID = ?", [id], (err, res) => {
        db.detach();
        if (err) {
          reject(err);
        } else {
          resolve({ message: `Categoría con ID ${id} eliminada` });
        }
      });
    });

    return { statusCode: 200, message: "Categoría eliminada correctamente", data: result };
  } catch (error) {
    console.error("Error al eliminar la categoría:", error);
    return { statusCode: 500, message: "Error interno del servidor" };
  }
});
