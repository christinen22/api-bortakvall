import express from "express"
import cors from 'cors'
import products from './product_routes'
import orders from './order_routes'

// instantiate a new router
const router = express.Router()

// List of allowed origins (CORS)
const allowedOrigins = ['http://localhost:3003'];

// Options to pass into .use(cors)
const options: cors.CorsOptions = {
	origin: allowedOrigins
  }

/**
 * GET /
 */
router.get('/', (req, res) => {
	res.send({
		message: "I AM API, BEEP BOOP",
	})
})

// CORS middleware
router.use(cors(options))

//Products
router.use('/products', products)

//Orders
router.use('/orders', orders)




export default router
