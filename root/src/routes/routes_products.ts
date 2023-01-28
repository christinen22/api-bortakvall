import express from 'express'
import { index, show, store, update, destroy } from '../controllers/controllers_products'
const router = express.Router()

// Get all orders
router.get('/orders', index)

// Get one order
router.get('/:orderId', show)

// Post orders
router.post('/orders', store)

// Update order
router.patch('/:orderId', update)

// Delete order
router.delete('/:orderId', destroy)

export default router
