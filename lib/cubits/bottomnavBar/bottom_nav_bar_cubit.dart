import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/homescreens/category.dart';
import 'package:shopapp/homescreens/favority.dart';
import 'package:shopapp/homescreens/home.dart';
import 'package:shopapp/homescreens/setting.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int currentindex = 0;
  List<Widget> screens = const [
    homeview(),
    category(),
    favority(),
    setting(),
  ];

  void changeview({required int index}) {
    currentindex = index;
    emit(successChange());
  }
}
