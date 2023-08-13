import { db } from "../database/db.connection.js"

export function createUserDB(body, hash) {
  const { userName, email, tel, cpf, userImage } = body;
  return db.query(
    `
    INSERT INTO users 
    ("userName", "email", "tel", "cpf", "userImage", "hash") 
    VALUES ($1, $2, $3, $4, $5, $6)
    ;`,
    [userName, email, tel, cpf, userImage, hash]
  );
}

export function getUserDB(email) {
  return db.query(`SELECT "userId", hash FROM users WHERE email = $1;`, [email])
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
    SELECT users."userId" 
    FROM sessions 
      JOIN users
      ON users."userId" = sessions."userId"
    WHERE token = $1
  ;`,
    [token]
  )
}

export const deleteSessionDB = (token) => {
  return db.query("DELETE FROM sessions WHERE token = $1;", [token])
}
