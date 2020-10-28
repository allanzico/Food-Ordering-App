import 'package:flutter/material.dart';
import 'package:market/Models/Category.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Widgets/Loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoriesWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                width: 100,
                image: NetworkImage(category.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black26),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(category.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))))
        ],
      ),
    );
    // return Stack(
    //   children: [
    //     Container(
    //       height: 50,
    //       width: 100,
    //       decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(5),
    //           boxShadow: [
    //             BoxShadow(
    //                 color: Colors.black26,
    //                 offset: Offset(0.0, 2.0),
    //                 blurRadius: 6.0)
    //           ]),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(5),
    //         child: Image(
    //           image: NetworkImage(category.image),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       top: 15,
    //       left: 15,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             category.name,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w600,
    //                 letterSpacing: 1.2),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
    // return Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(0.0),
    //     child: Row(
    //       children: <Widget>[
    //         Positioned(
    //           left: 0,
    //           top: 0,
    //           child: Container(
    //             child: Image(
    //               image: NetworkImage(category.image),
    //               height: 65,
    //               width: 65,
    //               alignment: Alignment.bottomLeft,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           width: 5,
    //         ),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Text(
    //               category.name,
    //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //             )
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
