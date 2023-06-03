## MVVM with Repository pattern using GetX in Flutter 🚀
This project implements the MVVM (Model-View-ViewModel) architecture with the Repository pattern in Flutter, using the GetX library for state management and dependency injection.

## About the architecture 🏗️
The MVVM architecture was chosen for its numerous advantages such as better separation of responsibilities, increased testability, and less coupling between UI logic and business logic.

The main components of this architecture are:

* Model: Represents the data and state of the app.
* View: Is the visual representation of the user interface, and doesn't contain any business logic.
* ViewModel: Is an abstraction of the View that exposes relevant data streams to the UI. It communicates with the Model to perform tasks and update the View's state.

The Repository pattern is an integral part of this architecture. The repository is an abstraction layer between the data sources (such as network APIs, local databases, etc.) and the rest of the app. It allows the data sources to be changed without affecting the rest of the app's code.

<p align="center">
  <img width="50%" src="https://github.com/iamageo/flutter_mvvm_template/assets/26925002/f34159ea-efb6-462c-9000-9fa9355a01b9">
</p>

## About GetX 📦
GetX is an efficient and easy to use state management, navigation, and dependency injection library for Flutter. In the context of this architecture, GetX is used to bind the ViewModels to Widgets in a reactive way, making it easy to update the UI whenever the ViewModel's state changes.

## How to use this project 🛠️
* Clone the repository
* Clone this repository to your local machine.
* Install the dependencies
* Run the app

## Basic Project Structure 📂
The project is structured as follows:

```
lib
│   main.dart   
└───ui
│   └───viewmodel
│       │   example_view_model.dart
└───remote
│   └───api
│   └───exceptions
│   └───model
│   └───repository
│   └───response
│       │   file111.txt
│       │   ...
```

* lib - Contains the main source code of the app.
* models - Contains data models.
* views - Contains user interface files.
* viewmodels - Contains ViewModel.
* remote - Contains API related files.
* api - Contains all API-related classes.
* exceptions - Contains custom exception classes that handle specific scenarios.
* model - Contains data models.
* repository - Contains the Repository classes.
* response - Contains response classes used for handling API responses.

I hope you find this project useful as a starting point for building Flutter apps using the MVVM architecture, Repository pattern, and GetX! 😃

## License 
```
    Copyright 2023 Geovani Amaral

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

```
