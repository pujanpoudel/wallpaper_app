Flutter Wallpaper App

This is a Flutter app that fetches and displays wallpapers using the Wallhaven API. Users can browse, search, and view high-resolution wallpapers within the app.

Features

Fetches wallpapers from Wallhaven API.
Search for wallpapers by tags, categories, and resolutions.
Secure API key management using a .env file.
Support for different wallpaper resolutions and categories.
Project Structure

bash
Copy code
flutter_wallpaper_app/
├── lib/
│ ├── main.dart # App entry point
│ ├── api_service.dart # API service to fetch wallpapers
│ ├── models/ # Models for parsing API responses
│ ├── screens/ # UI screens for different app pages
│ └── widgets/ # Custom widgets used across the app
├── .env # Environment variables (not tracked by Git)
├── .gitignore # Git ignore file to exclude sensitive data
├── pubspec.yaml # Flutter dependencies
└── README.md # This file
Setup

Follow the steps below to set up the project locally and manage your API key securely.

1. Clone the Repository
   bash
   Copy code
   git clone https://github.com/pujanpoudel/wallpaper_app.git
   cd wallpaper-app
2. Install Flutter Dependencies
   Make sure you have Flutter installed on your machine. Then, install the dependencies:

bash
Copy code
flutter pub get

3. Set Up Environment Variables
   To manage your Wallhaven API key and other sensitive data, create a .env file in the root of your project:

bash
Copy code
touch .env
In the .env file, add your Wallhaven API key like this:

bash
Copy code
API_KEY=your_api_key_here

4. Load Environment Variables
   Ensure that the app loads environment variables from the .env file. In the main.dart file, flutter_dotenv is used to load the API key:

dart
Copy code
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
await dotenv.load(fileName: ".env");
runApp(MyApp());
} 5. Exclude .env from Git
The .env file contains sensitive information (like API keys), so it is excluded from version control in .gitignore:

bash
Copy code

# Add this to .gitignore

.env
This ensures the API key is kept private and won't be pushed to GitHub.

6. Run the App
   Run the app using the Flutter command:

bash
Copy code
flutter run
How to Contribute

If you'd like to contribute to this project, feel free to submit a pull request or open an issue with any bugs or feature requests.

Fork the project
Create a new feature branch (git checkout -b feature-branch)
Commit your changes (git commit -m 'Add some feature')
Push to the branch (git push origin feature-branch)
Open a pull request
License

This project is licensed under the MIT License - see the LICENSE file for details.
