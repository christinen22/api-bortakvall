import Debug from 'debug'
import { Request, Response } from 'express'
import { validationResult } from 'express-validator'
import prisma from '../prisma'

// Create a new debug instance
const debug = Debug('root:product_controller')

//
// Get all products
//
export const index = async (req: Request, res: Response) => {
	try {
		const product = await prisma.product.findMany()

		res.send({
			status: "success",
			data: product,
		})

	} catch (err) {
		debug("Error thrown when finding products", err)
		res.status(500).send({ status: "error", message: "Something went wrong" })
	}

}

//
// Get a single product
//
export const show = async (req: Request, res: Response) => {
    const productId = Number(req.params.productId)

	try {
		const product = await prisma.product.findUniqueOrThrow({
			where: {
				id: productId,
			}

		})

		res.send({
			status: "success",
			data: product,
		})

	} catch (err) {
		console.debug(err)
		res.status(404).send({
			message: "Not found",
		})
	}
}

//
//Create product
//
export const store = async (req: Request, res: Response) => {

	// Check validation
	const validationErrors = validationResult(req)
	if (!validationErrors.isEmpty()) {
		return res.status(400).send({
			status: "fail",
			data: validationErrors.array()
		})
	}
	
	try {
		const product = await prisma.product.create({
			data: {
				name: req.body.name,
				description: req.body.description,
				price: req.body.price,
				on_sale: req.body.on_sale,
				images: req.body.images,
				stock_status: req.body.stock_status,
				stock_quantity: req.body.stock_quantity,
			}
		})

		res.send({
			status: "success",
			data: product,
		})

	} catch (err) {
		console.debug("Error thrown when creating a product %o: %o", req.body, err)
		res.status(500).send({ status: "error", message: "Something went wrong" })
	}
}


