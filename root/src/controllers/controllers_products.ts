import { Request, Response } from 'express'
import Debug from 'debug'
import prisma from '../prisma'

// Create a new debug instance
const debug = Debug('prisma-products:controllers_products')

//
// Get all products
//
export const index = async (req: Request, res: Response) => {
	try {
		const products = await prisma.products.findMany()

		res.send({
			status: "success",
			data: products,
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
		const product = await prisma.products.findUniqueOrThrow({
			where: {
				id: productId,
			}

		})

		res.send({
			status: "success",
			data: product,
		})

	} catch (err) {
		console.error(err)
		res.status(404).send({
			message: "Not found",
		})
	}
}

//
//Create product
//
export const store = async (req: Request, res: Response) => {
	try {
		const product = await prisma.products.create({
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
		debug("Error thrown when creating a product %o: %o", req.body, err)
		res.status(500).send({ status: "error", message: "Something went wrong" })
	}
}


