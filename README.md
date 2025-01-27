# flutter-item-list
Technical test

This test is composed of two modules:
- Backend: Kotlin with Ktor Framework 
- App: Flutter with Bloc

The frontend follows the Flutter Architecture described [here](https://docs.flutter.dev/app-architecture)


## Backend
Gradle is used to get dependencies and build the project. To quickly run the project, execute the command 'sh run.sh' present at the root of the backend project.

If you want to compile and run manually follow the next set of instructions.

#### Compile
To create a runnable jar, navigate to the root of the backend project and execute the following command 
'''
./gradlew clean buildFatJar
'''

#### Run Server
On the root of the backend project run the command to execute the server
'''
java -jar build/libs/backend-all.jar
'''

You can also navigate 'build/libs/' and execute 'java -jar backend-all.jar'. The file 'backend-all.jar' is a fat jar ie, contains all the libraries and can be executed in any computer with java installed.


### Add Item
'''
curl --location 'http://localhost:9999/items' \
--header 'Content-Type: application/json' \
--data '{
  "title": "Echos",
  "description": "Song by Pink Floyd"
}'
'''

### Get items
'''
curl --location 'http://localhost:9999/items'
'''

## App