import express from 'express'
import { body } from 'express-validator'
import { index, show, store, addItem } from '../controllers/order_controller'
const router = express.Router()

// Get all orders
router.get('/', index)

// Get one order
router.get('/:orderId', show)

// Post order
router.post('/', store)

// Attach products to order
router.post('/:orderId/products', addItem)



export default router
