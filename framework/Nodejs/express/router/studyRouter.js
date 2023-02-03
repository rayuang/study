import express from 'express'
let studyRouter = express.Router()

studyRouter.get("/content",(req,res) => {
    res.json({uname:"wangruijie"})
})

export default studyRouter
