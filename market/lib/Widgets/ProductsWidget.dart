import 'package:flutter/material.dart';
import 'package:market/Models/Product.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Widgets/SmallIconButton.dart';
import 'package:provider/provider.dart';

class ProductsWidget extends StatefulWidget {
  final ProductModel productModel;

  const ProductsWidget({Key key, this.productModel}) : super(key: key);
  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]),
//            height: 160,
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  "images/food.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(ProductModel.NAME,
                            style: TextStyle(color: Colors.grey)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(1, 1),
                                    blurRadius: 4),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(ProductModel.NAME,
                              style: TextStyle(color: Colors.grey)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(ProductModel.NAME,
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(ProductModel.NAME,
                                style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(
                            width: 2,
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
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(ProductModel.NAME,
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Stack(
    //     children: [
    //       Container(
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(5),
    //           child: Image.asset("images/shish-kebab.jpg"),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             SmallIconButton(
    //               icon: Icons.favorite,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Container(
    //                 width: 50,
    //                 decoration: BoxDecoration(
    //                     color: Colors.white,
    //                     borderRadius: BorderRadiusDirectional.circular(5)),
    //                 child: Row(
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.all(2),
    //                       child: Icon(
    //                         Icons.star,
    //                         color: Colors.black,
    //                         size: 20,
    //                       ),
    //                     ),
    //                     Text("4.5")
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       Positioned(
    //         left: 0.0,
    //         bottom: 0.0,
    //         child: Container(
    //             height: 70,
    //             width: MediaQuery.of(context).size.width,
    //             decoration: BoxDecoration(
    //                 gradient: LinearGradient(
    //                     colors: [Colors.black, Colors.black12],
    //                     begin: Alignment.bottomCenter,
    //                     end: Alignment.topCenter))),
    //       ),
    //       Positioned(
    //         left: 10.0,
    //         bottom: 10.0,
    //         right: 10.0,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Row(
    //                   children: <Widget>[
    //                     Text(
    //                       "Matooke",
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 20,
    //                           letterSpacing: 3,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     Text(
    //                       " (per kg)",
    //                       style: TextStyle(
    //                         color: Colors.grey,
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             Column(
    //               children: <Widget>[
    //                 Text(
    //                   "UGX 20000",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
