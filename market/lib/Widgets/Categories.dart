import 'package:flutter/material.dart';
import 'package:market/Models/Category.dart';

List<Category> categoriesList = [
  Category(name: "vegetables", image: "vegetables.jpg"),
  Category(name: "steak", image: "shish-kebab.jpg"),
  Category(name: "fish", image: "tilapia.jpg"),
  Category(name: "fruits", image: "banana.jpg")
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      "images/${categoriesList[index].image}",
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(categoriesList[index].name)
              ],
            ),
          );
        },
      ),
    );
  }
}
