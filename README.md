# Google Keep Plasmoid for KDE Plasma 6

A KDE Plasma 6 widget that integrates Google Keep directly into your desktop for quick and seamless access to your notes.

![Google Keep Plasmoid](https://img.shields.io/badge/KDE%20Plasma-6-blue) ![License](https://img.shields.io/badge/license-MIT-green) ![Qt](https://img.shields.io/badge/Qt-6.4%2B-brightgreen)

## ✨ Features

- **Direct Google Keep Integration**: Full Google Keep interface embedded in your desktop
- **Persistent Login**: Stay logged in across system restarts.
- **Customizable Zoom**: Set and remember your preferred zoom level
- **Lightweight**: Optimized for performance with minimal resource usage


## 🚀 Installation

### Method 1: Direct Installation (Recommended)

```bash
# Clone the repository
git clone https://github.com/LoneWolf728/Google-Keep-Plasmoid-for-KDE-Plasma-6.git
cd Google-Keep-Plasmoid-for-KDE-Plasma-6

# Install the widget
kpackagetool6 --type=Plasma/Applet --install package --packageroot ~/.local/share/plasma/plasmoids/

# Restart Plasma
kquitapp6 plasmashell && kstart plasmashell

# Now you can add it from the Widgets menu
```

### Method 2: Build from Source

```bash
# Clone and navigate to the project
git clone https://github.com/LoneWolf728/Google-Keep-Plasmoid-for-KDE-Plasma-6.git
cd Google-Keep-Plasmoid-for-KDE-Plasma-6

# Create build directory
mkdir build && cd build

# Configure and build
cmake ..
make

# Install
sudo make install

# Restart Plasma
kquitapp6 plasmashell && kstart plasmashell
```

### Method 3: KDE Store

*Coming soon - will be available through System Settings > Get New Widgets*

## 📋 Requirements

- **KDE Plasma**: 6.0 or later
- **Qt**: 6.4 or later
- **QtWebEngine**: For web content rendering
- **KF6 Components**: KPackage, CoreAddons, Plasma

### Installing Dependencies

#### Fedora
```bash
sudo dnf install kf6-kpackage-devel kf6-kcoreaddons-devel plasma-devel extra-cmake-modules qt6-qtwebengine-devel
```

#### Ubuntu/Debian
```bash
sudo apt install libkf6package-dev libkf6coreaddons-dev plasma-framework-dev extra-cmake-modules qt6-webengine-dev
```

#### Arch Linux
```bash
sudo pacman -S plasma-framework qt6-webengine extra-cmake-modules
```

## 🎯 Usage

1. **Add Widget**: Right-click on your desktop or panel → "Add Widgets" → Search for "Google Keep"
2. **First Use**: Click the widget icon to open Google Keep and log in with your Google account
3. **Resize**: Drag the widget corners to your preferred size
4. **Configure**: Right-click the widget → "Configure" for customization options (Nothing here yet :) Will add in the future releases.)

## ⚙️ Configuration Options

- **Icon Settings**: Choose between different icon options (dark/light mode icon) (WIP)

## 🛠️ Development

This is my first KDE Plasma widget and first time working with QML. Built with:

- **QML**: For the user interface
- **QtWebEngine**: For Google Keep integration
- **KF6 APIs**: For native Plasma integration
- **CMake**: Build system

### Project Structure
```
google-keep-plasmoid/
├── package/
│   ├── contents/
│   │   ├── ui/
│   │   │   ├── main.qml
│   │   │   └── WebView.qml
│   │   ├── config/
│   │   │   └── main.xml
│   │   └── images/
│   │       └── google-keep-icon.svg
│   └── metadata.json
├── CMakeLists.txt
└── README.md
```

## 🤝 Contributing

Contributions are welcome! This being my first plasmoid, Let me hear your suggestions on improvements. Or any other plamoid you'd like me to give a shot at:

- Performance optimizations
- UI/UX improvements
- Bug fixes
- Feature suggestions

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Open a Pull Request

## 🐛 Known Issues

- Initial load may take a few seconds (QtWebEngine startup)

## 📝 Changelog

### v1.0.0
- Initial release
- Google Keep integration
- Persistent login support
- Configurable zoom levels

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- KDE Community for excellent documentation and support
- The authors of "Chat AI" plasmoid, Denys Madureira and Bruno Gonçalves. It was the inspiration behind making this.

## 💬 Support

- **Issues**: [GitHub Issues](https://github.com/LoneWolf728/Google-Keep-Plasmoid-for-KDE-Plasma-6/issues)

---

**Made with ❤️ for the KDE Community**

*If you find this widget useful, consider giving it a ⭐ on GitHub!*