import { Router } from "express"
import { signIn, signUp, signOut } from "../controllers/auth.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.js"
import { userSchema } from "../schemas/user.schemas.js"
import { authSchema } from "../schemas/auth.schemas.js"

const authRouter = Router()

authRouter.post("/signup", validateSchema(userSchema), signUp)
authRouter.post("/signin", validateSchema(authSchema), signIn)
authRouter.delete("/signin", signOut)

export default authRouter