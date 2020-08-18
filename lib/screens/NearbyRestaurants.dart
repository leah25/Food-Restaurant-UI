import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_rest_app/data/data.dart';
import 'package:food_rest_app/models/restaurant.dart';
import 'package:food_rest_app/screens/Ratings.dart';
import 'package:food_rest_app/screens/restaurantDetails.dart';

class NearbyRes extends StatefulWidget {
  @override
  _NearbyResState createState() => _NearbyResState();
}

class _NearbyResState extends State<NearbyRes> {
  _restaurantList(BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AboutRes(
                      restaurant: restaurant,
                    )));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Hero(
              tag: restaurant.imageUrl,
              child: Image(
                width: 100,
                height: 100,
                image: AssetImage(restaurant.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Ratings(
                    rating: restaurant.rating,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    restaurant.address,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    restaurant.distance,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              'Nearby Restaurants',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  letterSpacing: 1.2),
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Restaurant restaurant = restaurants[index];
                  return _restaurantList(context, restaurant);
                }),
          ),
        ],
      ),
    );
  }
}
