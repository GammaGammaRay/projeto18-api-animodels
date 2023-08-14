import { db } from "../database/db.connection.js"

export async function insertAnimalDB(animalData, token) {
  console.log(animalData)
  const { animalName, description, hirePrice, photoMain, contact, available } =
    animalData

  return db.query(
    `
    INSERT INTO animals ("animalName", "description", "hirePrice", "photoMain", contact, "authorId", available) 
    VALUES ($1, $2, $3, $4, $5, (SELECT "userId" FROM sessions WHERE token = $6), $7) 
    RETURNING "animalId"
    ;`,
    [animalName, description, hirePrice, photoMain, contact, token, available]
  )
}

export async function getAnimalByIdDB(animalId) {
  const animal = await db.query(
    `
    SELECT 
  animals."animalId", 
  animals."animalName", 
  animals.description,
  animals."photoMain", 
  animals."hirePrice",
  animals.available, 
  JSON_BUILD_OBJECT(
    'userName', users."userName",
    'tel', users.tel,
    'userImage', users."userImage"
  ) AS "userData"
FROM animals
JOIN users 
  ON users."userId" = animals."authorId"
WHERE animals."animalId" = $1;`,
    [animalId]
  )
  // console.log(animal.rows)
  return animal
}

export async function toggleAnimalAvailabilityDB(animalId) {
  try {
    const { rows } = await db.query(
      `SELECT available FROM animals WHERE "animalId" = $1`,
      [animalId]
    )

    if (rows.length === 0) {
      throw new Error("Animal not found")
    }

    const newAvailability = !rows[0].available

    const result = await db.query(
      `UPDATE animals SET available = $1 WHERE "animalId" = $2 RETURNING *`,
      [newAvailability, animalId]
    )

    return result.rows[0]
  } catch (error) {
    throw new Error(`Error toggling animal availability: ${error.message}`)
  }
}

export async function getAnimalListDB() {
  return db.query(`SELECT * FROM animals`)
}

export const putAnimal = async (req, res) => {
  const { authorization } = req.headers
  const { id } = req.params
  try {
    const { rowCount } = await updateCatalogueById(
      id,
      authorization.replace("Bearer ", "")
    )
    if (rowCount === 0)
      return res
        .status(400)
        .send("Model not found, or you do not have authorization to change it")

    res.sendStatus(204)
  } catch ({ detail }) {
    res.status(500).send({ message: detail })
  }
}
