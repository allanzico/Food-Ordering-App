import 'package:flutter/material.dart';
import 'package:market/Models/Category.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Widgets/Loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

List<CategoryModel> categoriesList = [];

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryProvider.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 5.0),
            child: Card(
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
                            placeholder: kTransparentImage,
                            image: categoryProvider.categories[index].image),
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
                          categoryProvider.categories[index].name,
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
