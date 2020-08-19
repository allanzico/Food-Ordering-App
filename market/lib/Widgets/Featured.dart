import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Models/Product.dart';
import 'package:market/Screens/ProductDetails.dart';

List<ProductModel> productList = [];

class FeaturedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                      context,
                      ProductDetails(
                        product: productList[index],
                      ));
                },
                child: Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(1, 1),
                            blurRadius: 3),
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/${productList[index].image}",
                        height: 150,
                        width: 200,
                        // alignment: Alignment.topCenter,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(productList[index].name),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: null
                                ? Icon(
                                    Icons.favorite,
                                    size: 18,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                    productList[index].rating.toString(),
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 16,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("\$${productList[index].price}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
