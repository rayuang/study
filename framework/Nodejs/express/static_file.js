import express from 'express'
const app = express()
// 指定静态文件文件夹，使express托管静态资源，可以设置多个
app.use(express.static("public"))
app.use(express.static("static"))
// 访问静态资源时不需要其设置的目录的url，其文件相对于目录读取
// 若想要url加上其目录，则在use注册中间件时加上目录路径即可
// app.use("/static",express.static("static"))

app.listen(3000, () => {
    console.log("http://localhost:3000/")
})