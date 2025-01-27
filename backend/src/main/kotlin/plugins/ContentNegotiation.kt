package plugins

import io.ktor.serialization.jackson.*
import io.ktor.server.application.*
import io.ktor.server.plugins.contentnegotiation.*

fun Application.contentNegotiation(){
    install(ContentNegotiation) {
        jackson()
    }
}