import 'dart:ui';

import 'package:book_shop/bloc/authentication/auth_bloc.dart';
import 'package:book_shop/bloc/category/category_bloc.dart';
import 'package:book_shop/bloc/home/home_bloc.dart';
import 'package:book_shop/constants/constants.dart';
import 'package:book_shop/data/data_source/authentication_datasource.dart';
import 'package:book_shop/data/repository/authentication_repository.dart';
import 'package:book_shop/di/di.dart';
import 'package:book_shop/screens/card_screen.dart';
import 'package:book_shop/screens/category_screen.dart';
import 'package:book_shop/screens/home_screen.dart';
import 'package:book_shop/screens/login_screen.dart';
import 'package:book_shop/screens/product_detail_screen.dart';
import 'package:book_shop/screens/product_screen.dart';
import 'package:book_shop/screens/profile_screen.dart';
import 'package:book_shop/util/auth_manager.dart';
import 'package:book_shop/widgets/banner_slider.dart';
import 'package:book_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getitInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: selectedBottomNavigation,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigation = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedBottomNavigation,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                  fontFamily: 'SB',
                  fontSize: 11,
                  color: CustomColors.blueIndicator),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'SB',
                fontSize: 10,
                color: CustomColors.grey,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('images/person.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: Image.asset('images/person_active.png'),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blueIndicator,
                            blurRadius: 20,
                            spreadRadius: -20,
                            offset: Offset(0.0, 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: 'حساب شخصی',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/market_shop.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: Image.asset('images/market_shop_active.png'),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blueIndicator,
                            blurRadius: 20,
                            spreadRadius: -20,
                            offset: Offset(0.0, 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: 'محصولات',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/category.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: Image.asset('images/category_active.png'),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blueIndicator,
                            blurRadius: 20,
                            spreadRadius: -20,
                            offset: Offset(0.0, 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: 'دسته بندی',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/home.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: Image.asset('images/home_active.png'),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.blueIndicator,
                            blurRadius: 20,
                            spreadRadius: -20,
                            offset: Offset(0.0, 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  label: 'خانه',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return <Widget>[
      ProfileScreen(),
      CardScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: CategoryScreen(),
      ),
      BlocProvider(
        create: (context) {
          return HomeBloc();
        },
        child: HomeScreen(),
      ),
    ];
  }
}
