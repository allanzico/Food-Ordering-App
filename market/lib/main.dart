import 'package:flutter/material.dart';
import 'package:market/Providers/AppProvider.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Providers/MarketProvider.dart';
import 'package:market/Providers/ProductProvider.dart';
import 'package:market/Screens/MainScreen.dart';
import 'package:market/Screens/SigninScreen.dart';
import 'package:provider/provider.dart';

import 'Providers/UserProvider.dart';
import 'Widgets/Loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: MarketProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Akatale',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: MainScreen())));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);

    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.UnAuthenticated:
      case Status.Authenticating:
        return SignInScreen();
      case Status.Authenticated:
        return MainScreen();
      default:
        return SignInScreen();
    }
  }
}
