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
