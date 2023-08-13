import Joi from "joi"

export const userSchema = Joi.object({
  userName: Joi.string().required(),
  email: Joi.string().email().required(),
  cpf: Joi.string().length(11).required(),
  tel: Joi.string().required(),
  userImage: Joi.string().uri().required(),
  password: Joi.string().min(6).required(),
  confirmPassword: Joi.string().min(6).required(),
})
