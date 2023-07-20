# Flutter Developer Assignment

For this assignment, I implemented the [MVVM] (Model View ViewModel) architectural pattern. To follow best practices, I used the recommended folder structure [GetX] provided by the [get] package and created the folder structure using the [get_cli] command line tool. To manage the state and routes in the app, I used the [get] package. For dependency injection (DI), I replaced the default DI of the [get] package (bindings) with the [get_it] package (locator). I used the [http] package for network calls and the [shared_preferences] package for local storage. Additionally, I used the [audioplayers] package for handling audio and the [flutter_animate] package to apply animation.

## Architecture of this assignment: MVVM

MVVM (Model View ViewModel) is one of the most popular architectural patterns for Flutter projects. It separates the User Interface (View Layer) from the Business Logic (ViewModel Layer) and the Data Logic (Model Layer). Below is how I implemented it in this assignment:

<b>Model Layer:</b> The Model ("Repositories" in this assignment) is responsible for the backend logic of the app. It controls the data source, which in my case, includes the local (save songs to local storage) and remote data sources (iTunes API calls).

<b>ViewModel Layer:</b> The ViewModel ("Controllers" in this assignment) is where we implement the business logic of our app. It receives data from the Model Layer, applies business logic to the data, and updates the View Layer.

<b>View Layer:</b> The View ("Views" in this assignment) is the User Interface of the app and it also controls user input and sends it to the ViewModel Layer.

## Introduction of this assignment:

This assignment consists of four screens: Home, Music, Detail, and Favorite.

<b>Home Screen:</b> The landing screen of the app. When the user taps the "Get Started" button, they will be taken to the Music Screen.

<b>Music Screen:</b> This screen allows users to search for songs on iTunes. The results are shown in a vertical list. When the user taps on a song, they will be taken to the Detail Screen.

<b>Detail Screen:</b> This screen displays the details of the selected song. The user can play a preview track of the song and save the song to their favorites list.

<b>Favorite Screen:</b> This screen shows the list of favorite songs that the user saved in local storage. The songs are displayed in a vertical list. When the user taps on a song, they will be taken to the Music Detail Screen.
