import { getSessionDB } from "../repositories/auth.repository.js"

export async function validateAuth(req, res, next) {
  const { authorization } = req.headers

  const token = authorization?.replace("Bearer ", "")
  if (!authorization || token === "Bearer")
    return res.status(401).send({ message: "Invalid token" })

  try {
    const { rowCount } = await getSessionDB(token)
    if (rowCount === 0)
      return res.status(401).send({ message: "Session not found" })

    next()
  } catch (err) {
    console.log(err)
    res.status(500)
  }
}
