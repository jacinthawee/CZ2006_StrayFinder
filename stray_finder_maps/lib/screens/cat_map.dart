import 'package:flutter/material.dart';

class CatDetailScreen extends StatelessWidget {
  static const routeName = '/cat_detail_screen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(id),
      ),
    );
  }
}