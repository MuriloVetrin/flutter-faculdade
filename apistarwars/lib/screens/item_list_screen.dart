import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/film.dart';
import 'item_details_screen.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  late List<Film> films;

  @override
  void initState() {
    super.initState();
    fetchFilms();
  }

  Future<void> fetchFilms() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/films'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        films = List<Film>.from(data['results'].map((film) => Film.fromJson(film)));
      });
    } else {
      throw Exception('Failed to fetch films');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Films')),
      body: films != null
          ? ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, index) {
                final film = films[index];
                return ListTile(
                  title: Text(film.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailsScreen(item: film),
                      ),
                    );
                  },
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
