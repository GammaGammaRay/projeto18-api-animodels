import Joi from "joi"

export const userSchema = Joi.object({
  userName: Joi.string().required(),
  email: Joi.string().email().required(),
  cpf: Joi.string().required(),
  tel: Joi.string().required(),
//   cpf: Joi.number().integer().required().min(10000000000).max(99999999999),
//   tel: Joi.number().integer().required().min(1000000000).max(9999999999),
  userImage: Joi.string().uri().required(),
  password: Joi.string().min(6).required(),
  confirmPassword: Joi.string().min(6).required(),
})
