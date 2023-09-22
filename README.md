# task_manager

Task Manager.

## Description
# Architecture
- The Model-View-View model architecture was adopted for clear sepration of business logic.

- # State management
- Flutter has inbuilt state mangement features like inherited widgets which state management packages like provider and riverpod use under the hood. 
- The inherited widget state management was used to save user login details like the userName and uid.
- Additionally the mobx state mangement package was also used to fecth business logic to conform to the MVVM architecture.

- # Authentication
- Firebase authentication was used to authenticate users through anonymous sign-in.

- # Storage
- Firebase firestore storage was used to save users tasks with additional features of updating and deleting tasks.
- # Local Storage
- For persistence, the hive-flutter package was leveraged to persist data to to device local storage. This package was chosen to because of its fast read and write functionality compared to counterparts like sqlite.

- # Dependency Injection
- Dependency injection was handled with get_it package and its singleton feature was used to adopt a singleton pattern which provides a global reference to a class or object. 


