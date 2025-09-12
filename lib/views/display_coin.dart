import 'dart:developer';

import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    fetchCryptoData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crypto Prices',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.grey[900],
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : cryptoData.isEmpty
                  ? Center(child: Text('No data available'))
                  : ListView.builder(
                      itemCount: cryptoData.length,
                      itemBuilder: (context, index) {
                        final coin = cryptoData[index];
                        final changeColor = coin.priceChange24h != null
                            ? (coin.priceChange24h! >= 0
                                ? Colors.green
                                : Colors.red)
                            : Colors.grey;

                        return Card(
                          margin: EdgeInsets.all(8.0),
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              coin.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Symbol: ${coin.symbol}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Price: \$${coin.price?.toStringAsFixed(2) ?? 'N/A'}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Market Cap: \$${coin.marketCap?.toStringAsFixed(2) ?? 'N/A'}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '24h Change: ${coin.priceChange24h?.toStringAsFixed(2) ?? 'N/A'}%',
                                  style: TextStyle(
                                    color: changeColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
