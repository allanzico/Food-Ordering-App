import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Models/Product.dart';
import 'package:market/Providers/MarketProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Screens/MarketScreen.dart';
import 'package:market/Widgets/SmallIconButton.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final marketProvider = Provider.of<MarketProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Stack(
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
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "Ugx " + product.price.toString(),
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Text(product.category),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 70,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(product.market),
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
              image: NetworkImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
//     return Padding(
//       padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
//       child: Container(
//         height: 120,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey[300],
//                   offset: Offset(-2, -1),
//                   blurRadius: 5),
//             ]),
// //            height: 160,
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: 140,
//               height: 120,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(5),
//                   topLeft: Radius.circular(5),
//                 ),
//                 child: Image.network(
//                   product.image,
//                   fit: BoxFit.cover,
//                   alignment: Alignment.bottomLeft,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           product.name,
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 3),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey[300],
//                                     offset: Offset(1, 1),
//                                     blurRadius: 4),
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Icon(
//                               Icons.favorite_border,
//                               color: Colors.black,
//                               size: 18,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(
//                           height: 25,
//                           child: OutlineButton(
//                             color: Colors.black,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Text(
//                               product.market,
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 12,
//                               ),
//                             ),
//                             onPressed: () async {
//                               // await productProvider.loadProductsByMarket(
//                               //     marketId: product.marketId);
//                               // // await marketProvider.loadSingleMarket(
//                               // //     marketId: product.marketId);
//                               // changeScreen(
//                               //     context,
//                               //     MarketScreen(
//                               //       marketModel: marketProvider.market,
//                               //     ));
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0),
//                             child: Text(
//                               product.rating.toString(),
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Colors.black,
//                             size: 16,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Colors.black,
//                             size: 16,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Colors.black,
//                             size: 16,
//                           ),
//                           Icon(
//                             Icons.star,
//                             color: Colors.black,
//                             size: 16,
//                           ),
//                           Icon(
//                             Icons.star_half,
//                             color: Colors.black,
//                             size: 16,
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Text(
//                           "UGX " + product.price.toString(),
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
  }
}
