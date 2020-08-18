import 'package:flutter/material.dart';
import 'package:food_rest_app/data/data.dart';
import 'package:food_rest_app/screens/CartScreen.dart';
import 'package:food_rest_app/screens/NearbyRestaurants.dart';
import 'package:food_rest_app/screens/recentOrders.dart';

class FoodDelivery extends StatefulWidget {
  @override
  _FoodDeliveryState createState() => _FoodDeliveryState();
}

class _FoodDeliveryState extends State<FoodDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle, color: Colors.white, size: 30.0),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'Food Delivery',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Text(
              'Cart ${currentUser.cart.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 8.0, color: Colors.deepOrange),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 3.0, color: Colors.deepOrange),
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          RecentOrders(),
          NearbyRes(),
        ],
      ),
    );
  }
}
