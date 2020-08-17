import 'package:flutter/material.dart';
import 'package:market/Providers/Authentication.dart';
import 'package:market/Screens/LoginScreen.dart';
import 'package:market/Screens/MainScreen.dart';
import 'package:market/Screens/SigninScreen.dart';
import 'package:provider/provider.dart';

import 'Widgets/Loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider.initialize())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Akatale',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreenController())));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.UnAuthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return MainScreen();
      default:
        return LoginScreen();
    }
  }
}
