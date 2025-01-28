# flutter-item-list
Technical test

This test is composed of two modules:
- Backend: Kotlin with Ktor Framework 
- App: Flutter with Bloc

The frontend follows the Bloc Architecture described [here](https://bloclibrary.dev/architecture/)


## Backend
The project utilizes Gradle for dependency management and building processes. For convenience, a precompiled JAR file and a shell script are included to allow for quick execution of the project.

To start the server, execute the following command from the root directory of the project:
```
sh run-server.sh
``` 
If you want to compile and run the server manually follow the next set of instructions.

#### Compile
To generate a runnable JAR file, navigate to the backend directory and execute the following command:
```
./gradlew clean buildFatJar
```

#### Run Server
On the backend folder, execute the following command to start the server:
```
java -jar build/libs/backend-all.jar
```

You can also navigate `build/libs/` and execute `java -jar backend-all.jar`. The file `backend-all.jar` is a fat jar ie, contains all the libraries and can be executed in any computer with java installed.


### Add Item
To add an Item to the server via the terminal, you can use the curl command. Modify the title and description as needed to suit your preferences.
```
curl --location 'http://localhost:9999/items' \
--header 'Content-Type: application/json' \
--data '{
  "title": "Echos",
  "description": "Song by Pink Floyd"
}'
```

### Get items
To retrieve an item from the server, use the following curl command:

```
curl --location 'http://localhost:9999/items'
```

## App
### Visual Studio Code
The application was developed using Visual Studio Code, and a launch.json file has been included for your convenience. To run the app, start Visual Studio code 