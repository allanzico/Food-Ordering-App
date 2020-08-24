import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Providers/MarketProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Screens/CategoryScreen.dart';
import 'package:market/Screens/MarketScreen.dart';
import 'package:market/Widgets/Categories.dart';
import 'package:market/Widgets/Featured.dart';
import 'package:market/Widgets/Loading.dart';
import 'package:market/Widgets/MarketsWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final marketProvider = Provider.of<MarketProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: appProvider.isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Loading()],
            )
          : SafeArea(
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Let's order some groceries",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.notifications_none),
                            onPressed: () {},
                          ),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300],
                                offset: Offset(1, 1),
                                blurRadius: 3),
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                              hintText: "Find Groceries in Markets",
                              border: InputBorder.none),
                        ),
                        trailing: Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 75,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryProvider.categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await productProvider.loadProductsByCategory(
                                categoryName:
                                    categoryProvider.categories[index].name);
                            changeScreen(
                                context,
                                CategoryScreen(
                                    categoryModel:
                                        categoryProvider.categories[index]));
                          },
                          child: CategoriesWidget(
                              category: categoryProvider.categories[index]),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Featured",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("See All",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                    ],
                  ),
                  FeaturedWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Popular Markets",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("See All",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                    ],
                  ),
                  Column(
                    children: marketProvider.markets.map((item) {
                      return GestureDetector(
                        onTap: () async {
                          await productProvider.loadProductsByMarket(
                              marketId: item.id);
                          changeScreen(
                              context,
                              MarketScreen(
                                marketModel: item,
                              ));
                        },
                        child: MarketsWidget(
                          market: item,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
