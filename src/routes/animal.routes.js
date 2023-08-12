import { Router } from "express"
import { getAnimal, createAnimal, getAnimalList } from "../controllers/animal.controllers.js"
import { validateSchema } from "../middlewares/validateSchema.js"
import { animalSchema } from "../schemas/animal.schemas.js"
import { validateAuth } from "../middlewares/validateAuth.js"

const animalRouter = Router()

animalRouter.post("/animals", validateSchema(animalSchema), validateAuth, createAnimal)
animalRouter.get("/animals/:id", getAnimal)
animalRouter.get("/animals", getAnimalList)

export default animalRouter