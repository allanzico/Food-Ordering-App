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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                // Positioned(
                //     child: Align(
                //   alignment: Alignment.center,
                //   child: Loading(),
                // )),
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage, image: category.image),
              ],
            ),

            // Image(
            //   image: NetworkImage(
            //       categoryProvider.categories[index].image),
            //   height: 65,
            //   width: 65,
            //   alignment: Alignment.centerLeft,
            // ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  category.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
