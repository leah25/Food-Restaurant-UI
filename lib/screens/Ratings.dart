import 'package:flutter/material.dart';
import 'package:food_rest_app/models/restaurant.dart';

class Ratings extends StatelessWidget {

  final int rating;
  Ratings({this.rating});

  @override
  Widget build(BuildContext context) {

    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }
}
