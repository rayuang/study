import queryString from 'querystring'

const myurl = "username=wang&age=20"

const queryStringParse = queryString.parse(myurl)
console.log(queryStringParse,queryStringParse.username)
//[Object: null prototype] { username: 'wang', age: '20' } wang
const str = "id=3&name=abc&url=https://baidu.com/"
const escapeStr = queryString.escape(str) // 编码
const unEscapeStr = queryString.unescape(escapeStr) // 解码
console.log(str,"\n",escapeStr,"\n",unEscapeStr)
/* 
 id=3&name=abc&url=https://baidu.com/ 
 id%3D3%26name%3Dabc%26url%3Dhttps%3A%2F%2Fbaidu.com%2F
 id=3&name=abc&url=https://baidu.com/
*/