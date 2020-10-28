import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Providers/MarketProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Screens/CategoryScreen.dart';
import 'package:market/Screens/MarketScreen.dart';
import 'package:market/Screens/MarketSearchScreen.dart';
import 'package:market/Screens/ProductSearch.dart';
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
  String _selectedItem = "Products";

  @override
  Widget build(BuildContext context) {
    final marketProvider = Provider.of<MarketProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    void _selectItem(String name) {
      Navigator.pop(context);
      setState(() {
        _selectedItem = name;
        if (name == "Products") {
          appProvider.changeSearchBy(newSearchBy: SearchBy.PRODUCTS);
        } else {
          appProvider.changeSearchBy(newSearchBy: SearchBy.MARKETS);
        }
      });
    }

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
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 20),
                    child: Text(
                      "Hey " + userProvider.user.email + ",",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: Text(
                          "Let's order some groceries",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
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
                        trailing: IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            return showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: Colors.black54,
                                    child: Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).canvasColor,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30))),
                                        padding:
                                            EdgeInsets.only(top: 12, right: 10),
                                        child: Container(
                                            height: 100.0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ListTile(
                                                  leading: Icon(
                                                    Icons.fastfood,
                                                    color: Colors.black,
                                                  ),
                                                  title: Text('Products'),
                                                  onTap: () {
                                                    _selectItem("Products");
                                                  },
                                                ),
                                                Divider(
                                                  height: 1,
                                                  indent: 25,
                                                  endIndent: 25,
                                                ),
                                                ListTile(
                                                  leading: Icon(
                                                    Icons.store_mall_directory,
                                                    color: Colors.black,
                                                  ),
                                                  title: Text('Markets'),
                                                  onTap: () {
                                                    _selectItem("Markets");
                                                  },
                                                ),
                                                Divider(
                                                  height: 1,
                                                  indent: 25,
                                                  endIndent: 25,
                                                ),
                                              ],
                                            ))),
                                  );
                                });
                          },
                        ),
                        title: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (pattern) async {
                            appProvider.changeLoadingState();
                            if (appProvider.searchBy == SearchBy.PRODUCTS) {
                              await productProvider.filterProducts(
                                  productName: pattern.toLowerCase());
                              changeScreen(context, ProductSearchScreen());
                            } else {
                              await marketProvider.filterMarkets(
                                  marketName: pattern.toLowerCase());
                              changeScreen(context, MarketSearchScreen());
                            }

                            appProvider.changeLoadingState();
                          },
                          decoration: InputDecoration(
                              hintText: _selectedItem == "Products"
                                  ? "Search Products"
                                  : "Search Markets",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 0.3,
                    indent: 8,
                    endIndent: 8,
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
                  Divider(
                    height: 50,
                    thickness: 0.3,
                    indent: 8,
                    endIndent: 8,
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
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
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
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
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
