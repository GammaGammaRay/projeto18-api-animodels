import { db } from "../database/db.connection.js"
import { getAnimalByIdDB, insertAnimalDB } from "../repositories/animal.repository.js"


export async function getAnimal(req, res) {
  const { id } = req.params

  try {
    const { rows, rowCount } = await getAnimalByIdDB(parseInt(id))

    if (rowCount === 0) res.sendStatus(404)

    res.send(rows[0])
  } catch ({ detail }) {
    res.status(500).send({ message: detail })
  }
}

export async function createAnimal(animalData) {
  const { photos } = req.body
  const { authorization } = req.headers
  try {
    const { rows } = await insertAnimalDB(
      req.body,
      authorization.replace("Bearer ", "")
    )

    await insertPhotos(photos, rows[0].id)

    res.sendStatus(201)
  } catch ({ code, detail }) {
    if (code === "23503") return res.status(404).send({ message: detail })
    res.status(500).send({ message: detail })
  }
}

export async function getAnimalList() {
  try {
    const { rows } = await db.query(`SELECT * FROM animals`)

    return rows
  } catch (error) {
    throw new Error(`Error fetching animal list: ${error.message}`)
  }
}
