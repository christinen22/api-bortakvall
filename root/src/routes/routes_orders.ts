import express from 'express'
import { index, show, store, update, destroy } from '../controllers/controllers_orders'
const router = express.Router()

// Get all products

router.get('/products', index)

/**
 * GET one product
 */
router.get('/products/:productId', show)

/**
 * POST product
 */
router.post('/products', store)

/**
 * PATCH /resource/:resourceId
 */
router.patch('/:productsId', update)

/**
 * DELETE /resource/:resourceId
 */
router.delete('/:productsId', destroy)

export default router
