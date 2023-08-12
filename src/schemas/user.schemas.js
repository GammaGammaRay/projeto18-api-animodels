import Joi from "joi"

export const userSchema = Joi.object({
    email: Joi.string().email().required(),
    cpf: Joi.number().integer().required().min(10000000000).max(99999999999),
    password: Joi.string().min(6).required(),
    tel: Joi.number().integer().required().min(1000000000).max(9999999999),
});
