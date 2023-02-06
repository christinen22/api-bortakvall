import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/order_controller'
const router = express.Router()

// Get all orders
router.get('/', index)

// Get one order
router.get('/:orderId', show)

// Post order
router.post('/', [
    body('customer_first_name').isString().bail().isLength({ min: 2 }).withMessage('Minimum 2 characters'),
    body('customer_last_name').isString().bail().isLength({ min: 2 }).withMessage('Minimum 2 characters'),
    body('customer_address').isString().withMessage('Invalid address'),
    body('customer_postcode').isString().bail().isLength({ max: 6 }).withMessage('Invalid postcode'),
    body('customer_city').isString().withMessage('Invalid city'),
    body('customer_email').isEmail().withMessage('Has to be an e-mail'),
    body('customer_phone').isString(),
    body('order_total').isInt().isLength({ min: 1 }),
    body('order_items').notEmpty()
],  store)

// Attach products to order
router.post('/:orderId/products')



export default router



