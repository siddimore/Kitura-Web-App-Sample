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

// Resolve the port that we want the server to listen on.
let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

Kitura.addHTTPServer(onPort:port, with: router)
Kitura.run()
