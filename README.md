  Task Reminder Flutter Application

Task Reminder is a simple mobile application built with Flutter that allows you to add tasks with completion times, remove tasks, and receive notifications 2 minutes before the task completion time. The app utilizes various dependencies to enhance its functionality and user experience.

## Features

- **Add Task:** Easily add tasks to your list, specifying their titles, descriptions, and completion times.

- **Remove Task:** Remove tasks from your list when they are completed or no longer needed.

- **Notification:** Receive notifications 2 minutes before the task's completion time to help you stay organized.
- **Provider State Management:** The app utilizes the Provider package for efficient state management.
- **Splash Screen:** Enjoy a stylish splash screen with a Lottie animation when the app starts.
- **Local Data Storage:** All tasks are stored locally using Shared Preferences.

## Dependencies

The Task Reminder app relies on several Flutter packages to provide its functionality and features. Here's a brief description of each dependency:

- **cupertino_icons (Version 1.0.2):** Provides Cupertino (iOS-style) icons for use in the app's user interface.

- **provider (Version 6.0.5):** Implements the Provider pattern for state management, allowing efficient data sharing between different parts of the app.

- **flutter_local_notifications (Version 15.1.1):** Enables the scheduling and display of local notifications on the device.

- **timezone (Version 0.9.2):** Helps manage time zones for scheduling notifications accurately.

- **flutter_3d_drawer (Version 0.0.1):** Adds a 3D drawer component for an interactive and visually appealing user experience.

- **intl (Version 0.18.1):** Provides internationalization and localization support for displaying date and time in different formats based on the user's locale.

- **shared_preferences (Version 2.2.1):** Allows the app to store and retrieve data locally, such as user preferences and task information.

- **uuid (Version 4.0.0):** Generates universally unique identifiers (UUIDs) for tasks and notifications to ensure uniqueness.

- **lottie (Version 2.6.0):** Integrates Lottie animations into the app, enhancing the splash screen with visually appealing animations.

## State Management

The Task Reminder app employs the Provider package for efficient state management. Provider facilitates the sharing of task data, allowing components to react dynamically to changes in the task list.

## Splash Screen

The app features a splash screen with Lottie animations to provide an engaging and visually appealing introduction to the app.

## Screenshots

 
<img src="https://github.com/Abhishekverma657/Task-Reminder-/assets/74288334/08e9bfc3-ecda-43e8-a1b1-6bd0d09a8ddf" width="300" height="400">
 
<img src="https://github.com/Abhishekverma657/Task-Reminder-/assets/74288334/06b689bf-cb09-4c1a-a6fe-64e0fd40bc15" width="300" height="400">
 <img src ="https://github.com/Abhishekverma657/Task-Reminder-/assets/74288334/0cc1c035-c66c-44a5-b214-7441c608965c"width="300" height="400">

<img src= "https://github.com/Abhishekverma657/Task-Reminder-/assets/74288334/dbcb0f09-451e-4ca4-aa24-4933a1e1fb85" width="300" height="400">
<img src="https://github.com/Abhishekverma657/Task-Reminder-/assets/74288334/c799867d-62d9-4ab7-976a-e8348bf0cf90" width="300" height="400">



 

## Getting Started

To run the Task Reminder app locally, follow these steps:

1. Clone the repository to your local machine:

   ```shell
   git clone https://github.com/your-username/task-reminder.git
   ```

2. Navigate to the project directory:

   ```shell
   cd task-reminder
   ```

3. Install the app's dependencies using Flutter:

   ```shell
   flutter pub get
   ```

4. Run the app on an emulator or physical device:

   ```shell
   flutter run
   ```

The Task Reminder app should now be running on your device, allowing you to manage tasks and receive timely notifications.

Enjoy staying organized and never miss a task with Task Reminder!
