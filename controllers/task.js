import DB from "../DBase/dataBase.js"
import jwt from 'jsonwebtoken'

export const addTask = (req, res) => {
    
    jwt.verify('eyJhbGciOiJIUzI1NiJ9.MQ.tTBSSgL-JMTgqTphkKPy2_jfeyjuWh86dYoY2dRudBo', "jwtkey", (err, id) => {
        if(err) return res.status(403).json("Token is not Valid!")
        
        const q = 'INSERT INTO taskmanager (`title`, `cat`, `date`, `subtask`, `note`, `userid`) VALUES(?)'
        const values = [
            req.body.title,
            req.body.cat,
            req.body.date,
            JSON.stringify(req.body.subtask),
            req.body.note,
            req.body.userId
        ]

        DB.query(q, [values], (err, data) => {
            if(err) return res.status(500).json(err)
            return res.json("Task registered successfully!")
        })
    })
}

export const getTasks = (req, res) => {
    
    const q = `SELECT * FROM taskmanager WHERE ${req.query.search ? 'title LIKE ? AND userid=?' : 'userid=?'} ORDER BY taskmanager.id DESC`
    DB.query(q, req.query.search ? [`%${req.query.search}%`,req.query.id] : req.query.id, (err,data) => {
        if(err) return res.status(500).send(err)
        if(data.length > 0){
            for (let i = 0; i < data.length; i++) {
                data[i].subtask = JSON.parse(data[i].subtask) 
            }
            return res.json(data)
        }else{
            return res.json([])
        }
    })
}


export const updateTask = (req, res) => {

        const q = `UPDATE taskmanager SET ${req.body.title ? 'title=?' : req.body.note ? 'note=?' : 'subtask=?'} WHERE id=?`

        if(req.body.title){
            DB.query(q, [ req.body.title, req.params.id ], (err, data) => {
                if(err) return res.status(500).json(err)
            })
        }
        if(req.body.note){
            DB.query(q, [ req.body.note, req.params.id ], (err, data) => {
                if(err) return res.status(500).json(err)
            })
        }
        if(req.body.subtask){
            DB.query(q, [ JSON.stringify(req.body.subtask), req.params.id ], (err, data) => {
                if(err) return res.status(500).json(err)
            })
        }

}

export const deleteTask = (req, res) => {
    const taskId = req.params.id
    const q = 'DELETE FROM taskmanager WHERE id=?'

    DB.query(q, taskId, (err,data) => {
        if(err) return console.log(err)
        
    })
    
}