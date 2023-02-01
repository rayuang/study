import express from "express"
const app = express()
app.get("/",(req,res)=>{
    res.write("helloworld")
    res.end()
})
app.get("/login",(req,res)=>{
    res.send("login send")
})

app.listen(3000,()=>{
    console.log("server start")
})