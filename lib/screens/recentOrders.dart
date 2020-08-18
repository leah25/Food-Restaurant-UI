import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_rest_app/data/data.dart';
import 'package:food_rest_app/models/order.dart';

class RecentOrders extends StatelessWidget {
  _theRecentOrders(BuildContext context, Order order) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: 320,
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image(
            width: 100,
            height: 100,
            image: AssetImage(order.food.imageUrl),
            fit: BoxFit.cover,
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
                  order.food.name,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  order.restaurant.name,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  order.date,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20.0),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(Icons.add, color: Colors.white),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 25, letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _theRecentOrders(context, order);
            },
          ),
        ),
      ],
    );
  }
}
