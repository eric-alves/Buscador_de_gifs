import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  int _offSet = 0;

  Future<Map> _getGifs() async {
    http.Response response;
    if (_search == null) {
      var url = Uri.parse(
          'https://api.giphy.com/v1/gifs/trending?api_key=8EyqITn8PFDLldvMR0DzPzva6zSn6pLg&limit=20&rating=g');
      response = await http.get(url);
    } else {
      var url = Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=8EyqITn8PFDLldvMR0DzPzva6zSn6pLg&q=$_search&limit=20&$_offSet=0&rating=g&lang=en');
      response = await http.get(url);
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((value) => {print(value)});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
