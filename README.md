# technical_test_avilatek

This Flutter project is a Technical Test for Avilatek. The app uses the [The Movie Database API](https://developers.themoviedb.org/3/getting-started/introduction) to show a list of movies and their details.

The architecture used is BLoC, and the app is divided in 3 main screens:
- Feed: Shows a list of movies. The user can click on a movie to see its details.
- Movie Details: Shows the details of a movie. The user can click on an actor to see its details.
- Actor Profile: Shows the details of an actor and a list of movies where he/she has participated. The user can click on a movie to see its details.
Each of these screens has their own BLoC's.
There is also a common folder that contains all the things that the screens share.

The design of the screens was provided by Avilatek, and the app was developed by me.

## :rocket: Installation
The APK is located in the root of the project, in a file called `test_avilatek.apk`. You can download it and install it in your Android device.

If you want to run the app in debug mode, follow the next steps:

### :eyes: Pre-requisites
The development environment is contained in a [Docker devcontainer]('https://code.visualstudio.com/docs/devcontainers/containers'), so you need to have installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Visual Studio Code Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Android Debug Bridge (adb)](https://developer.android.com/studio/command-line/adb)

### :hammer: Steps
1. Clone the repository (If you are on Windows, it is recomended to clone it inside the [WSL2]('https://learn.microsoft.com/en-us/windows/wsl/about') filesystem).
2. Open the project in Visual Studio Code.
3. Open the Command Palette (Ctrl+Shift+P) and select `Remote-Containers: Reopen in Container`.
4. Wait for the container to build and start. (It may take a while the first time).
5. Create a file in root folder called .env and copy the values of the existing .env.template.
6. Open a terminal inside the container (Terminal -> New Terminal).
7. Run `flutter pub get` to install the dependencies.
8. Connect your Android device to your computer using ADB. Here is a [tutorial]('https://developer.android.com/tools/adb').
9. Run `flutter run` to start the app in debug mode.

### :warning: Notice
The prevoius steps are only necessary if you want to run the app in debug mode. If you only need to check the source-code you can do it by just cloning the repository.


