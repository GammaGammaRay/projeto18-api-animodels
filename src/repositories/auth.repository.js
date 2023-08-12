import { db } from "../database/db.connection.js"

export function createUserDB(body, password) {
  const { name, email, cellphone, cpf, imageUrl } = body
  return db.query(
    `
    INSERT INTO users 
    (name, email, cellphone, cpf, "imageUrl", password) 
    VALUES ($1, $2, $3, $4, $5, $6)
    ;`,
    [name, email, cellphone, cpf, imageUrl, password]
  )
}

export function getUserDB(email) {
  return db.query("SELECT id, password FROM users WHERE email = $1;", [email])
}

export const getSessionDB = (token) => {
  return db.query("SELECT * FROM sessions WHERE token = $1", [token])
}

export const createSessionDB = async (token, id) => {
  await db.query('INSERT INTO sessions (token, "userId") VALUES ($1, $2);', [
    token,
    id,
  ])

  return db.query(
    `
    SELECT users.name 
    FROM sessions 
      JOIN users
      ON users.id = sessions."userId"
    WHERE token = $1
  ;`,
    [token]
  )
}

export const deleteSessionDB = (token) => {
  return db.query("DELETE FROM sessions WHERE token = $1;", [token])
}
