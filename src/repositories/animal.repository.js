import { db } from "../database/db.connection.js"

export async function insertAnimalDB(userId, animalData) {
  const {
    animalName,
    animalDescription,
    hirePrice,
    photoMain,
    contact,g
    available,
  } = animalData

  const { rows } = await db.query(
    'SELECT sessions."userId" FROM sessions WHERE token = $1;',
    [token]
  )

  return db.query(
    `
    INSERT INTO animals ("animalName", "animalDescription", "hirePrice", "photoMain", contact, available, "createdAt") 
    VALUES ($1, $2, $3, $4, $5, $6, NOW()) 
    RETURNING "animalId"
    ;`,
    [animalName, animalDescription, hirePrice, photoMain, contact, available]
  )
}

export async function getAnimalByIdDB(animalId) {
  return db.query(
    `
  SELECT 
    catalogue.id, catalogue.title, catalogue.description, catalogue.avaliable, 
    breeds.name AS "breedName",
    (SELECT photos.url FROM photos WHERE photos.id = catalogue."mainPhotoId") AS "imageUrl",
    JSON_BUILD_OBJECT(
      'name', users.name,
      'cellphone', users.cellphone,
      'imageUrl', users."imageUrl"
    ) AS "userData"
  FROM breeds
    JOIN catalogue 
    ON catalogue."breedId" = breeds.id 
    JOIN users 
    ON catalogue."userId" = users.id
  WHERE catalogue.id = $1
;`,
    [animalId]
  )
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
  try {
    const { rows } = await db.query(`SELECT * FROM animals`)
    return rows
  } catch (error) {
    throw new Error(`Error getting animal list: ${error.message}`)
  }
}
