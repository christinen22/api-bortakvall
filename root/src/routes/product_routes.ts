import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/product_controller'
const router = express.Router()

// Get all products

router.get('/', index)


// Get one product
 
router.get('/:productId', show)


// Post product
 
router.post('/', [
    body('name').isString(),
    body('description').isString(),
    body('price').isInt().bail().isLength({ min: 1 }),
    body('images').isString,
    body('stock_status').isString(),
    body('stock_quantity').isInt().bail().isLength({ min: 0 })
], store)



export default router
