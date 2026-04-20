import 'dart:convert';

import 'package:flutter/material.dart' hide SearchBar;
import 'package:http/http.dart' as http;
import 'package:fluttertechnewz/utils/key.dart' as app_key;
import 'package:fluttertechnewz/components/searchbar.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&pageSize=100&apiKey=${app_key.Key.apiKey}&q=${SearchBar.searchcontroller.text}',
    ),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}
