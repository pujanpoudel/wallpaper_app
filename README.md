# Flutter Wallpaper App 🖼️

A modern Flutter application that brings beautiful wallpapers to your device using the [Wallhaven API](https://wallhaven.cc/help/api). Browse, search, and download high-resolution wallpapers with ease.

## ✨ Features

- 🔍 Advanced search functionality with tags, categories, and resolutions
- 🌈 High-resolution wallpaper support
- 🔐 Secure API key management
- 📱 Responsive design for various screen sizes
- 🎨 Multiple wallpaper categories
- ⬇️ Easy download and set wallpaper functionality
- 🌙 Light/Dark theme support

## 🛠️ Tech Stack

- Flutter
- Dart
- Wallhaven API
- flutter_dotenv for environment management
- http package for API calls

## 📁 Project Structure

```
flutter_wallpaper_app/
├── lib/
│   ├── main.dart                  # Application entry point
│   ├── services/
│   │   └── api_service.dart       # API integration
│   ├── models/                    # Data models
│   ├── screens/                   # UI screens
│   └── widgets/                   # Reusable widgets
├── .env                           # Environment variables
├── .gitignore
├── pubspec.yaml
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Flutter (latest version)
- Dart SDK
- A Wallhaven API key
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/pujanpoudel/wallpaper_app.git
   cd wallpaper-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**
   ```bash
   # Create a .env file in the root directory
   cp .env.example .env
   
   # Add your Wallhaven API key to .env
   API_KEY=your_api_key_here
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🔑 API Key Setup

1. Get your API key from [Wallhaven](https://wallhaven.cc/settings/account)
2. Create a `.env` file in the project root
3. Add your API key:
   ```env
   API_KEY=your_api_key_here
   ```
4. The `.env` file is gitignored to keep your API key secure

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create your feature branch
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. Commit your changes
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. Push to the branch
   ```bash
   git push origin feature/AmazingFeature
   ```
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Wallhaven](https://wallhaven.cc/) for providing the amazing wallpaper API
- Flutter team for the fantastic framework
- All contributors who help improve this project
