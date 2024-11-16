// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final _controller = TextEditingController();
  final String _sessionToken = '1234567890';
  List<dynamic> _placelist = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    getSuggtion(_controller.text);
  }

  void getSuggtion(String input) async {
    String placesApiKey = "AlzaSyZoAHL1ZBwAnBPj22Zd4dB8eoxfEzG9IlT";
    try {
      String baseURL =
          'https://maps.gomaps.pro/maps/api/place/autocomplete/json?input=madani biryni&key=AlzaSyz5eQY2okYsDapiB2YxoW1ddO0VNd6HCqo';
      String reques =
          '$baseURL?input=$input&key=$placesApiKey&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(reques));
      var data = json.decode(response.body);
      if (kDebugMode) {
        print('MyData');
        print(data);
      }
      if (response.statusCode == 200) {
        setState(() {
          _placelist = json.decode(response.body)['prediction'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 8,
        title: Text('Google Maps in Flutter'),
      ),
      body: Column(
        children: [
          Align(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search your Location here',
                focusColor: Colors.white,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Image.asset('asset/google-maps1.png'),
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _placelist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {},
                  child: ListTile(
                    title: Text(_placelist[index]['description']),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
