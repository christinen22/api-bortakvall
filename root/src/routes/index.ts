import express from "express"
import products from './routes_products'
import orders from './routes_orders'

// instantiate a new router
const router = express.Router()

/**
 * GET /
 */
router.get('/', (req, res) => {
	res.send({
		message: "I AM API, BEEP BOOP",
	})
})

//Products
router.use('/products', products)

//Orders
router.use('/orders', orders)



export default router
