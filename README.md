# flutter-item-list
Technical test

This test is composed of two modules:
- Backend: Kotlin with Ktor Framework 
- App: Flutter with Bloc

The frontend follows the Bloc Architecture described [here](https://bloclibrary.dev/architecture/)


## Backend
The project utilizes Gradle for dependency management and building processes. For convenience, a precompiled JAR file and a shell script are included to allow for quick execution of the project.
The server runs in the port `9999`

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
The following instructions assume that the Android framework, Xcode with iOS libraries, and the Flutter framework are already installed and configured on your computer.


### Server URL configuration
To configure the app to access the server, the configuration file must be updated with the server's URL.

1. Locate the configuration file at:
`app/lib/config.dart`.

2. Update the apiUrl variable with the IP address or URL where the server is running.

Ensure that the correct server URL is specified to enable proper communication between the app and the server.
```
// config.dart
const String apiUrl = "http://<server-ip>:9999";
const String apiItemsUrl = "$apiUrl/items";
```

Depending on the device where the app is running, the IP address of the server may vary. Be sure to specify the correct IP address or URL for the server, based on the device's network configuration.

| Device | Server IP | Notes | 
|---|---|---|
|iOS Simulator | http://0.0.0.0:9999 | Simulator and server are running in the same machine|
|Android Emulator | http://10.0.2.2:9999 [^1]| Simulator and server are running in the same machine|
| Physical device | http://< server-ip> :9999 | Server and device are different machines|

[^1]: 10.0.2.2 is a special IP address that allows the Android emulator to access a server running on the same machine. Please note that 0.0.0.0 **DOES NOT WORK** on Android, and should not be used for this purpose.

### Visual Studio Code
The application was developed using Visual Studio Code, and a launch.json file has been included.

To run the application:
- Open Visual Studio Code.
- Navigate to the Run and Debug section.
- Click the green play button.

Please ensure one of the following is available:

- A physical phone connected to the computer in debug mode.
- An iOS Simulator running.
- An Android phone emulator running.

### Terminal
To run the Flutter app without an IDE, a script has been provided for your convenience. Please execute the following command from the root directory of the project:

```
sh run-app.sh
```


## Unit tests
The unit tests are located in the `app/test` folder and test the item cubit class. Due to the Clean Architecture guidelines, the `ItemRepository` is an interface and can be mocked to focus the test in the ItemsCubit logic. I could have used a library like Mockito to have more control on the mock behaviour but for simplicity I created a stub version of the ItemRepository. The unit test can be executed from the app folder using the command
```
sh run_unit_tests.sh 
```



## Integration Tests
The integration tests are located in the `app/integration_test` folder and use the driver defined in `app/test_driver`. The driver is useful for extra features. In this particular case, I am using it to take a screenshot when the test completes. The screenshot will be in `app/screenshots/`.

To run the integration tests, a server must be running and a device must be connected to the computer (either physical or emulated device). Run the script from the app folder to execute the integration tests.

```
sh run_integration_tests.sh 
```