import express from "express"
import products from './product_routes'
import orders from './order_routes'

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
