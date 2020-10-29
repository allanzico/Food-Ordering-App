import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Models/Product.dart';
import 'package:market/Providers/MarketProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Screens/MarketScreen.dart';
import 'package:market/Widgets/SmallIconButton.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel product;

  const ProductWidget({Key key, this.product}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final marketProvider = Provider.of<MarketProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(-2, -1),
                          blurRadius: 5),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              widget.product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Text(
                            "Ugx " + widget.product.price.toString(),
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(widget.product.category),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 70,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              widget.product.market,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 15,
                bottom: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    width: 100,
                    image: NetworkImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart,
                        size: 20,
                      ),
                      onPressed: () async {
                        bool value = await userProvider.addToCart(
                            product: widget.product, quantity: 1);
                        if (value) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('ADDED TO BASKET'),
                            duration: Duration(seconds: 3),
                          ));

                          userProvider.getUser();
                        } else {}
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
