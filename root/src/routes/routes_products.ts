import express from 'express'
import { body } from 'express-validator'
import { index, show, store, update, destroy } from '../controllers/controllers_products'
const router = express.Router()

// Get all products

router.get('/', index)

/**
 * GET one product
 */
router.get('/:productId', show)

/**
 * POST product
 */
router.post('/', store)

/**
 * PATCH /resource/:resourceId
 */
router.patch('/:productsId', update)

/**
 * DELETE /resource/:resourceId
 */
router.delete('/:productsId', destroy)

export default router
