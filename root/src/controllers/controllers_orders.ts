/**
 * Controller Template
 */
import { Request, Response } from 'express'
import prisma from '../prisma'


// Get all orders
export const index = async (req: Request, res: Response) => {
    {
        try {
            const order = await prisma.orders.findMany()
            res.send(order)
    
        } catch (err) {
            console.error(err)
            res.status(500).send({
                message: "Something went wrong querying the database.",
            })
        }
    }
}


// Get a single order

export const show = async (req: Request, res: Response) => {
    const orderId = Number(req.params.orderId)

	try {
		const order = await prisma.orders.findUniqueOrThrow({
			where: {
				id: orderId,
			}

		})

		res.send(order)

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
