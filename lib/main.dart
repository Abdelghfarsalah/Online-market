import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import 'package:shopapp/cubits/search/search_cubit.dart';
import 'package:shopapp/loginRegister/Onboarding.dart';
import 'package:shopapp/homescreens/hompage.dart';
import 'package:shopapp/loginRegister/loginpage.dart';
import 'package:shopapp/loginRegister/registerPage.dart';
import 'package:shopapp/constant.dart';
import 'package:shopapp/helper/sharedpref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await helper.init();
  late Widget widget;
  var onboarding = await helper.getdata(key: 'onboarding');
  var token = await helper.getdata(key: 'token');
  if (onboarding != null) {
    if (token != null) {
      widget = const homepage();
    } else {
      widget = const registerPage();
    }
  } else {
    widget = const Onboarding();
  }
  runApp(Shop(
    widget: widget,
  ));
}

class Shop extends StatelessWidget {
  const Shop({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(
            create: (context) => ProductsCubit()
              ..getallcategory()
              ..getallproductd()
              ..getfavorits()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: defultfont),
        home: Onboarding(),
      ),
    );
  }
}
