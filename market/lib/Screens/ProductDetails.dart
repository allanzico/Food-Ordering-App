import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:market/Models/Product.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:market/Widgets/SmallIconButton.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({Key key, @required this.product}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                      images: [
                        AssetImage('images/${widget.product.image}'),
                        AssetImage('images/${widget.product.image}'),
                        AssetImage('images/${widget.product.image}')
                      ],
                      dotBgColor: Colors.white,
                      dotColor: Colors.grey,
                      dotIncreasedColor: Colors.black,
                      dotIncreaseSize: 1.5,
                      showIndicator: true,
                      autoplay: false,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 1000)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Stack(
                        children: [
                          IconButton(
                              icon: Icon(
                                EvaIcons.shoppingBag,
                                color: Colors.black,
                                size: 35,
                              ),
                              onPressed: null),
                          Positioned(
                            bottom: 8,
                            right: 5,
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text("22",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                      right: 15,
                      bottom: 60,
                      child: SmallIconButton(
                        icon: Icons.favorite,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.product.price.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
