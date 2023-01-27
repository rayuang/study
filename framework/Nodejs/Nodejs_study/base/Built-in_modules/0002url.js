import url from 'url'
import http, { request } from 'http'

const server = http.createServer()
server.on('request', (request, res) => {
    if (request.url === "/favicon.ico") {
        return
    }

    // http://localhost:8001/?username=wang&age=20
    console.log(url.parse(request.url,true).pathname)
    // [Object: null prototype] { username: 'wang', age: '20' }
    console.log(url.parse(request.url,true).query) // /
    console.log(url.parse(request.url,true).query.username)// wang
    console.log(url.format(url.parse(request.url)))
    // url.format() 将urlparse对象转成url地址

    /* 
    新版
    */
   const myurl = new URL(request.url,'http://localhost:8001')
   const search_params = myurl.searchParams
   console.log(myurl,"\n",search_params,"\n",)
   for(var [key,value] of search_params){
    console.log(key,value)
   }
   console.log(search_params.get('username'))// wang
   /* 
   URL {
     href: 'http://localhost:8001/?username=wang&age=20',
     origin: 'http://localhost:8001',
     protocol: 'http:',
     username: '',
     password: '',
     host: 'localhost:8001',
     hostname: 'localhost',
     port: '8001',
     pathname: '/',
     search: '?username=wang&age=20',
     searchParams: URLSearchParams { 'username' => 'wang', 'age' => '20' },
     hash: ''
   }
    URLSearchParams { 'username' => 'wang', 'age' => '20' }
    username wang
    age 20
   */
    let b = new URL("/one","http://localhost:8001")
    console.log(b)
    /* 
    URL {
      href: 'http://localhost:8001/one',
      origin: 'http://localhost:8001',
      protocol: 'http:',
      username: '',
      password: '',
      host: 'localhost:8001',
      hostname: 'localhost',
      port: '8001',
      pathname: '/one',
      search: '',
      searchParams: URLSearchParams {},
      hash: ''
    }
    */
    res.write(`
    <div>hello world</div>
    `)

    res.end()

})

server.listen(8001, () => {
    console.log("start")
})