import express from 'express'
import { addTask, getTasks, updateTask, deleteTask } from '../controllers/task.js'
const router = express.Router()

router.get('/', getTasks)
// router.get('/:id', getTasks)

router.post('/', addTask)

router.put('/:id', updateTask)

router.delete('/:id', deleteTask)

export default router