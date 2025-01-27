package plugins

import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import model.Item

private val itemList = mutableListOf<Item>()

fun Application.configureRouting() {
    routing {
        route("/items") {
            get {
                call.respond(HttpStatusCode.OK, itemList)
            }
            post {
                val item = call.receive<Item>()
                itemList.add(item)
                call.respond(HttpStatusCode.OK)
            }
        }
    }
}