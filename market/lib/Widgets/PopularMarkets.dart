import 'package:flutter/material.dart';
import 'package:market/Models/Market.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Providers/MarketProvider.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'Loading.dart';
import 'SmallIconButton.dart';

class PopularMarketsWidget extends StatelessWidget {
  final MarketModel market;

  const PopularMarketsWidget({Key key, this.market}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: [
                  // Positioned(
                  //     child: Align(
                  //   alignment: Alignment.center,
                  //   child: Loading(),
                  // )),
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage, image: market.image),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallIconButton(
                  icon: Icons.favorite,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(5)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        Text(market.rating.toString())
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.black12],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter))),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          market.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 3,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      market.averagePrice.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
