import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/product_controller'
const router = express.Router()

// Get all products

router.get('/', index)


// Get one product
 
router.get('/:productId', show)


// Post product
 
router.post('/', store)



export default router
