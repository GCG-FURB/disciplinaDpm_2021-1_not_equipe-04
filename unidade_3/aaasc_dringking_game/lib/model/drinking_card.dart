import 'package:flutter/cupertino.dart';

class DrinkingCard {
  final String name;
  final String category;
  final String imgUrl;
  final String description;
  final int difficulty;

  DrinkingCard({
    @required this.category,
    @required this.name,
    @required this.imgUrl,
    @required this.description,
    @required this.difficulty,
  });
}
