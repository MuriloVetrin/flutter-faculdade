import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  final dynamic item;

  const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Director: ${item.director}'),
            Text('Release Date: ${item.releaseDate}'),
            Text('Characters: ${item.characters.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
