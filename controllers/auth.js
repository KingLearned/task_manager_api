import DB from "../DBase/dataBase.js"
import stringCrypt from '../controllers/encodeApi.js'
import jwt from 'jsonwebtoken'



// DB.query('DROP DATABASE taskapp', (err,res) => {})
export const register = (req, res) => {    
    const encodePwd = stringCrypt.encrypt(req.body.pwd) // Encrypt Users Password

    const values = [ req.body.username, req.body.email, encodePwd ]

    if(req.body.username, req.body.email, encodePwd){
        const q = 'INSERT INTO taskusers (`username`, `email`, `pwd`) VALUES(?)'
        DB.query(q, [values], (err, data) => {
            if(err){
                const nameExist = err.sqlMessage ==   `Duplicate entry '${req.body.username}' for key 'authors.username'` && 'Username already exist!'
                const emailExist = err.sqlMessage ==   `Duplicate entry '${req.body.email}' for key 'authors.email'` && 'Email already exist!'
                const errMsg = nameExist || emailExist

                res.json({Error:errMsg})
            }
            if(!err){
                return res.json({success:'Registered Succefully!'})
            }
        })

    }
}
 
export const login = (req, res) => {
    const q = 'SELECT * FROM taskusers WHERE email=?'
    
    DB.query(q, req.body.email, (err, data) => {
        if(err) return console.log(err)
        
        if(data.length === 0) return res.json({Error:'User not found!'})

        if(data.length > 0){

            const decodePwd = stringCrypt.compare(data[0].pwd, req.body.pwd) // Decrypt Users Password
            if(!decodePwd){
                return res.json({Error:'Wrong username or password'})
            } else{
                
                const secureToken = jwt.sign(`${data[0].id}`, "jwtkey")
                const { pwd, email, ...other } = data[0]
                
                res.json({...other,token:secureToken})
            }
        }
    })
} 

export const logout = (req, res) => {
    res.clearCookie("access_token", {
        sameSite:'none',
        secure:true
    }).status(200).json('user has been logout')
} 