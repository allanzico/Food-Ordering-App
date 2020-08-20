import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';

import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Screens/ProductDetails.dart';
import 'package:provider/provider.dart';

class FeaturedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProvider.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                      context,
                      ProductDetails(
                        product: productProvider.products[index],
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
                      Image.network(
                        productProvider.products[index].image,
                        height: 150,
                        width: 200,
                        alignment: Alignment.topCenter,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(productProvider.products[index].name),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: true
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
                                    productProvider.products[index].rating
                                        .toString(),
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
                            child: Text(
                                "\$${productProvider.products[index].price}",
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
