
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import plugins.configureRouting
import plugins.contentNegotiation
import plugins.errorHandling


fun main() {
    embeddedServer(Netty, port = 9999, host = "0.0.0.0") {
        configureRouting()
        contentNegotiation()
        errorHandling()
    }.start(wait = true)
}


