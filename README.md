# 💹 CoinVibe – Flutter Crypto Tracker & News App

**CoinVibe** is a modern Flutter mobile application that delivers real-time cryptocurrency tracking, personalized favorites, intelligent search, and comprehensive crypto news — all in one sleek, responsive interface. Built for both casual investors and crypto enthusiasts, CoinVibe combines powerful functionality with an intuitive dark-themed UI.



## ✨ Key Features

### 📊 **Live Market Data**
- **Real-time cryptocurrency tracking** for the top **100 cryptocurrencies**
- Live price updates, market capitalization, and 24-hour price changes
- Color-coded indicators (green for gains, red for losses)
- Powered by **CoinMarketCap Pro API** for accurate, up-to-date data

### 🔍 **Advanced Search**

# 💹 CoinVibe – Flutter Crypto Tracker & News App

**CoinVibe** is a Flutter mobile app that provides live prices for the top 100 cryptocurrencies, a favorites/watchlist synced with Firebase, an instant search, and a multi-source crypto news feed.

This README was cleaned to remove duplicated/irrelevant blocks; screenshots (for recruiters/clients) are included below.

## ✨ Key Features

- Live market data for top 100 cryptocurrencies (prices, market cap, 24h change)
- Instant search by name or symbol with live filtering
- Favorites/watchlist persisted with Firebase Firestore and synced across devices
- Multi-source crypto news with detailed article view (CoinStats)
- Firebase Authentication (email/password + Google Sign-In)

## 📸 Screenshots (for recruiters & clients)

### Dashboard
![Dashboard](screenshots/dashboard-screen.jpg)

### Search
![Search](screenshots/search-screen.jpg)

### News
![News](screenshots/news-screen.jpg)

### Login / Register
![Login/Register](screenshots/login-register-screen.jpg)

### Profile
![Profile](screenshots/profile-screen.jpg)

> All screenshots are taken from the `screenshots/` folder.

## 🛠️ Technology

- Flutter 3.5.4+ / Dart 3.5.4+
- Firebase (Auth, Firestore)

# 💹 CoinVibe – Flutter Crypto Tracker & News App

**CoinVibe** is a Flutter mobile app for tracking the top 100 cryptocurrencies, managing favorites, searching quickly by name/symbol, and reading crypto news from multiple sources.

This README was cleaned to remove duplicated or development-only blocks. The app screenshots below are included to showcase the UI for recruiters and clients.

## ✨ Key Features

- Live market data for top 100 cryptocurrencies (price, market cap, 24h change)
- Instant search with live filtering (name/symbol)
- Favorites/watchlist persisted with Firebase Firestore and synced across devices
- Multi-source crypto news with detailed article view (CoinStats)
- Firebase Authentication (email/password and Google Sign-In)

## 📸 Screenshots (for recruiters & clients)

**Dashboard**
![Dashboard](screenshots/dashboard-screen.jpg)

**Search**
![Search](screenshots/search-screen.jpg)

**News**
![News](screenshots/news-screen.jpg)

**Login / Register**
![Login/Register](screenshots/login-register-screen.jpg)

**Profile**
![Profile](screenshots/profile-screen.jpg)

> Images are in the `screenshots/` folder. Replace them with higher-resolution versions if needed for presentations.

## 🛠️ Technology

- Flutter 3.5.4+ / Dart 3.5.4+
- Firebase (Auth, Firestore)
- CoinMarketCap Pro API (market data)
- CoinStats API (news)
- Provider (ready for global state), setState() for local UI updates

## 🚀 Quick start

1. Clone and install dependencies:

```powershell
git clone https://github.com/Mwahib001/CoinVibe-Flutter.git
cd CoinVibe-Flutter
flutter pub get
```

2. Configure Firebase:

- Create a Firebase project and enable Authentication + Firestore
- Download `google-services.json` and put it in `android/app/`
- Update `lib/firebase_options.dart` if needed

3. Add API keys:

- `lib/services/coin_list_service.dart` — set your CoinMarketCap API key
- `lib/views/news_section.dart` — set your CoinStats API key

4. Run locally:

```powershell
flutter run
```

Build (release):

```powershell
flutter build apk --release
flutter build appbundle --release
```

## Contributing

1. Fork the repo
2. Create a branch
3. Commit your changes and push
4. Open a pull request

## License

MIT — see the `LICENSE` file.

## Developer

Muhammad Wahib — https://github.com/Mwahib001

---

If you'd like, I can also:

- Reformat code blocks to be consistent
- Add a short "How it works" section for developers
- Produce a presentation-ready screenshot gallery (higher res)

```   - Update API keys in the service files:   - Update API keys in the service files:



### **Firebase Configuration**     - `lib/services/coin_list_service.dart` - CoinMarketCap API key     - lib/services/coin_list_service.dart - CoinMarketCap API key

Ensure your `android/app/build.gradle` includes:

```gradle     - `lib/views/news_section.dart` - CoinStats API key     - lib/views/news_section.dart - CoinStats API key

apply plugin: 'com.google.gms.google-services'

```