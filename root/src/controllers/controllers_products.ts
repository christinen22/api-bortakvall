/**
 * Controller Template
 */
import { Request, Response } from 'express'
import prisma from '../prisma'


// Get all products

export const index = async (req: Request, res: Response) => {
    {
        try {
            const product = await prisma.products.findMany()
            res.send(product)
    
        } catch (err) {
            console.error(err)
            res.status(500).send({
                message: "Something went wrong querying the database.",
            })
        }
    }

}


// Get a single product
export const show = async (req: Request, res: Response) => {
    const productId = Number(req.params.productId)

	try {
		const product = await prisma.products.findUniqueOrThrow({
			where: {
				id: productId,
			}

		})

		res.send(product)

	} catch (err) {
		console.error(err)
		res.status(404).send({
			message: "Not found",
		})
	}
}

/**
 * Create a resource
 */
export const store = async (req: Request, res: Response) => {
    try {
		const product = await prisma.products.create({
			data: req.body,
		})

		res.status(201).json(product)

	} catch (err) {
		console.error(err)
		res.status(500).send({
			message: "Something went wrong creating the record in the database.",
		})
	}
}

/**
 * Update a resource
 */
export const update = async (req: Request, res: Response) => {
}

/**
 * Delete a resource
 */
export const destroy = async (req: Request, res: Response) => {
}
