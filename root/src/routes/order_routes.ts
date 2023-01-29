import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/order_controller'
const router = express.Router()

// Get all orders
router.get('/', index)

// Get one order
router.get('/:orderId', show)

// Post orders
router.post('/', store)



export default router
