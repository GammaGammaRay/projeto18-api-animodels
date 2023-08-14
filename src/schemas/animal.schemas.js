import Joi from 'joi';

export const animalSchema = Joi.object({
    animalName: Joi.string().max(64).required(),
    description: Joi.string().required(),
    photoMain: Joi.string().uri().required(),
    hirePrice: Joi.number().required(),
    contact: Joi.string().max(50),
    available: Joi.bool(),
    authorId: Joi.number().integer().required(),
});


