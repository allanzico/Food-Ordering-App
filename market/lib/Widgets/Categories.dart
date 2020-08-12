import 'package:flutter/material.dart';
import 'package:market/Models/Category.dart';

List<Category> categoriesList = [
  Category(name: "vegetables", image: "apples.png"),
  Category(name: "steak", image: "bananas.png"),
  Category(name: "fish", image: "bone.png"),
  Category(name: "fruits", image: "fruits.png")
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image:
                          AssetImage("images/${categoriesList[index].image}"),
                      height: 65,
                      width: 65,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          categoriesList[index].name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
