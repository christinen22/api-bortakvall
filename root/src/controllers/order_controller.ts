import { Request, Response } from 'express'
import Debug from 'debug'
import prisma from '../prisma'

// Create a new debug instance
const debug = Debug('prisma-orders:order_controllers')

// Get all orders
export const index = async (req: Request, res: Response) => {
    {
        try {
            const order = await prisma.order.findMany()
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
		const order = await prisma.order.findUniqueOrThrow({
			where: {
				id: orderId,
			}

		})

		res.send({
			status: "success",
			data: order,
		})

	} catch (err) {
		console.error(err)
		res.status(404).send({
			message: "Not found",
		})
	}
}

//
//Create an order
//
export const store = async (req: Request, res: Response) => {
	try {
		const order = await prisma.order.create({
			data: {
				order_date: req.body.order_date,
				customer_first_name: req.body.customer_first_name,  
				customer_last_name: req.body.customer_last_name,
				customer_address: req.body.customer_address,    
			  	customer_postcode: req.body.customer_postcode,   
				customer_city: req.body.customer_city,       
				customer_email: req.body.customer_email,      
				customer_phone: req.body.customer_phone,      
				order_total: req.body.order_total,         
				order_items: req.body.order_items 
			}
		})

		res.send({
			status: "success",
			data: order,
		})

	} catch (err) {
		debug("Error thrown when creating a order %o: %o", req.body, err)
		res.status(500).send({ status: "error", message: "Something went wrong" })
	}

}

//
// Link product to order
//
export const addItem = async (req: Request, res: Response) => {
	try {
		const result = await prisma.order.update({
			where: {
				id: Number(req.params.orderId),
			},
			data: {
				order_items: {
					connect: {
						id: req.body.productId,
					}
				}
			},
		})
		res.status(201).send(result)
	} catch (err) {
		debug("Error thrown when adding product %o to an order %o: %o", req.body.productId, req.params.orderId, err)
		res.status(500).send({ message: "Something went wrong" })
	}
}

