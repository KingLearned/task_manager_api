import express from 'express'
import cors from 'cors'
import authRoutes from './Routes/Auth.js'
import taskRoute from './Routes/Tasks.js'
const PORT = 1000
const app = express()

app.use(express.json())
app.use(cors({ origin: '*' }))

app.use("/server/tasks", taskRoute)
app.use("/server/auth", authRoutes)

app.listen(PORT, () => {
    console.log(`Server Running on ${PORT}`)
})