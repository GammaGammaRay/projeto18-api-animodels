import Joi from 'joi';

export const animalSchema = Joi.object({
    animalName: Joi.string().max(63).required(),
    description: Joi.string().required(),
    img: Joi.string().uri().required(),
    hirePrice: Joi.number().integer().positive().required(),
    contact: Joi.string().max(50)
});


