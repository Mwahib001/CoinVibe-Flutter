import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/coin_list_service.dart';
import '../modules/coin_list_model.dart';

class FetchCryptoScreen extends StatefulWidget {
  const FetchCryptoScreen({super.key});

  @override
  FetchCryptoScreenState createState() => FetchCryptoScreenState();
}

class FetchCryptoScreenState extends State<FetchCryptoScreen> {
  bool isLoading = true;
  String errorMessage = '';
  List<Crypto> cryptoData = [];
  List<String> _favoriteIds = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchCryptoData();
    _loadFavorites();
  }

  Future<void> fetchCryptoData() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final data = await FetchCoinService().fetchLatestSpotPairs();
      setState(() {
        cryptoData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
      log('Error: $e'); // Debugging
    }
  }

  Future<void> _loadFavorites() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userData =
            await _firestore.collection('users').doc(user.uid).get();
        if (userData.exists) {
          final data = userData.data() as Map<String, dynamic>?; // Cast the data
          if (data != null) {
            List<dynamic> favorites = data['favorites'] ?? [];
            setState(() {
              _favoriteIds = favorites.map((fav) => fav.toString()).toList();
            });
          }
        }
      } catch (e) {
        log('Failed to load favorites: $e');
      }
    }
  }


  Future<void> _toggleFavorite(String cryptoId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      final userRef = _firestore.collection('users').doc(user.uid);
      try {
        if (_favoriteIds.contains(cryptoId)) {
          // Remove from favorites
          await userRef.update({
            'favorites': FieldValue.arrayRemove([cryptoId])
          });
          setState(() {
            _favoriteIds.remove(cryptoId);
          });
        } else {
          // Add to favorites
          await userRef.update({
            'favorites': FieldValue.arrayUnion([cryptoId])
          });
          setState(() {
            _favoriteIds.add(cryptoId);
          });
        }
      } catch (e) {
        log('Error updating favorites: $e');
        // Optionally, show a snackbar to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Prices',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.grey[900],
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : cryptoData.isEmpty
                  ? const Center(child: Text('No data available'))
                  : ListView.builder(
                      itemCount: cryptoData.length,
                      itemBuilder: (context, index) {
                        final coin = cryptoData[index];
                        final isFavorite = _favoriteIds.contains(coin.id);
                        final changeColor = coin.priceChange24h != null
                            ? (coin.priceChange24h! >= 0
                                ? Colors.green
                                : Colors.red)
                            : Colors.grey;

                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              coin.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Symbol: ${coin.symbol}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Price: \$${coin.price?.toStringAsFixed(2) ?? 'N/A'}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Market Cap: \$${coin.marketCap?.toStringAsFixed(2) ?? 'N/A'}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '24h Change: ${coin.priceChange24h?.toStringAsFixed(2) ?? 'N/A'}%',
                                  style: TextStyle(
                                    color: changeColor,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleFavorite(coin.id),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}