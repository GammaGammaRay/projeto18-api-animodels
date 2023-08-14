import { db } from "../database/db.connection.js"
import {
  getAnimalByIdDB,
  insertAnimalDB,
  getAnimalListDB,
  toggleAnimalAvailabilityDB,
} from "../repositories/animal.repository.js"

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

export async function createAnimal(req, res) {
  // const { photos } = req.body
  const token = req.headers.authorization.replace("Bearer ", "")
  console.log(token)
  try {
    await insertAnimalDB(token, req.body)

    // await insertPhotos(photos, rows[0].id)

    res.sendStatus(201)
  } catch (err) {
    const { code, detail } = err
    if (code === "23503") {
      return res.status(404).send({ message: detail })
    }
    console.log(err)
    res.sendStatus(500)
  }
}

export async function toggleAnimalAvailability(req, res) {
  const { animalId } = req.params

  try {
    const updatedAnimal = await toggleAnimalAvailabilityDB(animalId)
    res.status(200).json(updatedAnimal)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

export async function getAnimalList(req,res) {
  try {
    const animalList = await getAnimalListDB()
    console.log("List: ", animalList.rows)
    res.send(animalList.rows)
  } catch (error) {
    throw new Error(`Error getting animal list: ${error.message}`)
  }
}
