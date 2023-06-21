# movie_app

Movies Application

## Table of Contents
- [movie\_app](#movie_app)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Features](#features)
  - [Contributing](#contributing)

## Overview
 mobile application developed using Flutter. It allows users to discover and explore a wide range of movies, view details, and save their favorites. The app leverages Firebase Auth for user authentication and Firebase Firestore to store favorite movies.

## Installation
To install and run the app locally, follow these steps:
- Clone the repository:
git clone https://github.com/MiroMutti/movie-flutter-app.git
diff
Copy code
- Install Flutter and necessary dependencies.
- Run the app from main.g.dart:
flutter run
vbnet
Copy code

## Usage
Upon launching the app, users are presented with a list of movies retrieved from an external API. They can browse the movies, view details, and save their favorite movies by tapping on the favorite button. Users need to authenticate using their Firebase credentials to access the favorite movies feature.

## Features
- Fetches movie data from an external API via HTTP GET requests.
- Displays a list of movies with relevant information.
- Allows users to save movies as favorites using Firebase Auth for authentication.
- Retrieves and displays the user's favorite movies from Firebase Firestore.
- Provides a clean and intuitive user interface for seamless movie discovery.

## Contributing