import { db } from "../database/db.connection.js"

export async function insertAnimalDB(userId, animalData) {
  const { title, description, breedId, mainPhotoId, avaliable } = body

  const { rows } = await db.query(
    'SELECT sessions."userId" FROM sessions WHERE token = $1;',
    [token]
  )

  return db.query(
    `
    INSERT INTO catalogue (title, description, "breedId", "userId", "mainPhotoId", avaliable) 
    VALUES ($1, $2, $3, $4, $5, $6) 
    RETURNING id
    ;`,
    [title, description, breedId, rows[0].userId, mainPhotoId, avaliable]
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

export async function toggleAnimalAvailability(animalId) {
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
