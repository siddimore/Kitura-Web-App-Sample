import Kitura
import HeliumLogger

HeliumLogger.use()

let router = Router()

router.post("hello") {request, response, _ in

  response.send("HELLO WORLD")

}

router.get("hello") {request, response, next in

  let result = ["status":"ok","message" : "Hello World"]
  response.send(json:["result":result])
  next()
}

// router.all() {request, response, next in
//     response.send("Hello World")
//     try response.end()
// }

Kitura.addHTTPServer(onPort:8090, with: router)
Kitura.run()
