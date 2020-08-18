import 'package:flutter/material.dart';
import 'package:market/Providers/Authentication.dart';
import 'package:market/Providers/CategoryProvider.dart';
import 'package:market/Screens/MainScreen.dart';
import 'package:market/Screens/SigninScreen.dart';
import 'package:provider/provider.dart';

import 'Widgets/Loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Akatale',
          theme: ThemeData(
            primaryColor: Colors.black,
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
        return SignInScreen();
      case Status.Authenticated:
        return MainScreen();
      default:
        return SignInScreen();
    }
  }
}
