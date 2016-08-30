code 

func httpGet() {
    resp, err := http.Get("http://www.01happy.com/demo/accept.php?id=1")
    if err != nil {
        // handle error
    }
 
    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        // handle error
    }
 
    fmt.Println(string(body))
}

//Tips：使用这个方法的话，第二个参数要设置成”application/x-www-form-urlencoded”，否则post参数无法传递。

func httpPost() {
    resp, err := http.Post("http://www.01happy.com/demo/accept.php",
        "application/x-www-form-urlencoded",
        strings.NewReader("name=cjb"))
    if err != nil {
        fmt.Println(err)
    }
 
    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        // handle error
    }
 
    fmt.Println(string(body))
}


func httpPostForm() {
    resp, err := http.PostForm("http://www.01happy.com/demo/accept.php",
        url.Values{"key": {"Value"}, "id": {"123"}})
 
    if err != nil {
        // handle error
    }
 
    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        // handle error
    }
 
    fmt.Println(string(body))
 
}

//同上面的post请求，必须要设定Content-Type为application/x-www-form-urlencoded，post参数才可正常传递。
func httpDo() {
    client := &http.Client{}
 
    req, err := http.NewRequest("POST", "http://www.01happy.com/demo/accept.php", strings.NewReader("name=cjb"))
    if err != nil {
        // handle error
    }
 
    req.Header.Set("Content-Type", "application/x-www-form-urlencoded")
    req.Header.Set("Cookie", "name=anny")
 
    resp, err := client.Do(req)
 
    defer resp.Body.Close()
 
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        // handle error
    }
 
    fmt.Println(string(body))
}












var sysStat fun(fi os.FileInfo, h *Header) error
var zeroBlock = make([]byte, 2014)
const (
    blockSize = 512
    TypeReg = '0'
)
defer panic recover
f := def func(a, b int) int {
    return a + b
}

bytes.Buffer
bytes.Reader

io
ByteReader
ByteWriter
ByteScanner
Closer
LimitedReader
PipeReader


func Dial(net, address string)(Conn, error)
net.Dial("tcp",address)

func ReadFully(conn Conn) byte[]{
    defer conn.close
    result := bytes.NewBuffer(nil)
    var buf byte[512]
    for {
        n, err := conn.Read(buf[0:])
        if (err == io.EOF){
            break
        }
        result.Write(buf[0:n])
    }
    result, err := ioutil.ReadAll(conn)
    conn.Write()
    net.ResovleTCPAddress(service)
    net.DialTCP("tcp",nil,ResovledTCPAddress)

new(byte.Buffer)
if(err != nil){
    fmt.FPrintf(os.Stderr, "fatal error: %s", err.Error())
    os.Exit(1)
}
net.ResolveTCPAddress("tcp4","")
net.Dial()
net.DianlTCP("",l,r)
conn.Write()
conn.Read()n

net.ParseIP()
ip.DefaultMask()
http.DefaultClient.Get()
http.Get()
defer resp.Body.Close()
resp.StatusCode == http.StatusOk
http.Post
application/x-www-form-urlencoded
http.PostForm("", url.Values{})
http.Do()
req, error := http.NewRequst("GET", "httpurl", nil)
req.Header.Add("","")
client := &http.Client{}
reps, error := clinet.Do(req)
type Client struct{
    
}
http.ListenAndServe()
http.ListenAndServeTLS
http.Handle("",handler)
http.HandleFunc(
    "/bar", func(w http.ResponseWriter, r *http.Request)
    fmt.FPrintf(w, %s, html.EscapeString(r.URL.Path))
)
s := &http.Server{
    Addr: ":8080"
    Handler: myHandler
    ReadTimeOut: 10 * time.Second
    WriterTimeOut: 10*time.Second
    MaxHeaderBytes: 1<<20

}
var array = [...]string{
    
}
[]struct{}{}

package main
defer func(){
    if r := recover(); r != nil{
        fmt.Println()
    }
}()

os.Open(path)
bufio.NewReader(os.File)
line, isPrefix, err = reader.ReadLine()
string(line)
strcon.Atoi(string(line))
append()
flag.Parse()
var in *string = flag.String()
os.Create(string)

func TestfuncName(t *testing.T)
t.Error()

func TestfuncName(t *testing.T)

new(T)
&T{}
timeoutChan := make(chan bool, 1)
go func(){
    time.Sleep(6000)
    timeoutChan <- true
}()

select{
    case <-chan:
    case <-timeoutChan:
}

runtime.GOMAXPROCS(16)
runtime.Gosched()
sync.Mutex
sync.RWMutex
sync.Once.Do()

os.File
os.FileInfo
os.FileMode
os.LinkError
os.PathError
os.ProcAttr
os.Process
os.ProcessState
os.Signal
os.SyscallError
DevNull
Stdin =NewFile(uintptr(syscall.Stdin),"/dev/stdin")
Chdir()
Chmod()
Chown()
Chtimes()
Clearenv()
Environ
NewFile()
define(function(){
    return {
            mix:function(source,target){
        }
    }
});

define(['base'],function(base){
    return {
        show : function(){

        }
    }
});

define(['',''], function(){
    
});

db.getCollection("version")
ObjectId()
db.mydb.test
db.mydb[test].
db.bsonsize(doc)
--objcheck

insert()
update()
remove()
$inc
{%set : {"":""}}
$unset :{}
$push : {}
$pull:{}
$pop:{:1}
$push
$addToSet:{}
$lt $lte $gt $gte $ne $or $in $nin
find({$or:[{$in:[],{}]},)
$in:[],$exists:true
/joe/i
find{"comments":{"$elemMatch":{"":"","":{"$gte":5}}}}


text-decoration:overline,line-through,underline
font-weight

block inline none  = display 


==============================================================
var fs = require("fs")
fs.readFile('./resource.json',function(er, data){
    console.log(data)
});


var http = require('http')
http.createServer(function(req, res){
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World\n');
}).listen(3000);
console.log('Server started at port of 3000')

var server = http.createServer();
server.on('request',function(req,res){
    res.writeHead(200,{'Content-Type': 'text/plain'})
    res.end('Hello World\n')
});
server.lisente(3000)



header nav artical aside footer section



======================================================
package main

import(
    "net/http"
    "io/ioutil"
)

//保存每期彩票的对象
type PriceInfo struct{
    RedNums [5]int
    BlueNums int
}



func main(){
    resp, err := http.Get("")
    defer resp.Body.Close()

    body, err := ioutil.ReadAll(resp.Body)

    str := string(body)

    re := regexp.MustCompile("")
    strs := re.FindAllString(str, -1)

    for _, td range strs {

    }

}