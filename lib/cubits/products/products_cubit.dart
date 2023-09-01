import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/helper/sharedpref.dart';
import 'package:shopapp/homescreens/category.dart';
import 'package:shopapp/homescreens/favority.dart';
import 'package:shopapp/homescreens/home.dart';
import 'package:shopapp/homescreens/setting.dart';
import 'package:shopapp/models/category/category.dart';
import 'package:shopapp/models/favorites/favorites.dart';

import '../../constant.dart';
import '../../models/homeproductsmodel.dart';
import '../../models/usermodel/usermodel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  homeproductsmodel? model;
  Category1? modelcateg;
  Map<int, bool> fav = {};
  void getallproductd() async {
    emit(Productsloading());
    try {
      Dio dio = Dio(BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true));
      dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': tokenkey
      };
      await dio.get('home').then((value) {
        model = homeproductsmodel.fromjson(value.data);
        model!.data!.products.forEach((element) {
          fav.addAll({element.id: element.in_favorites});
        });
        print(fav.toString());
        print(tokenkey);
      });
      emit(Productssuccess(model: model!));
    } on Exception catch (e) {
      emit(Productsfauiler());
    }
  }

  void getallcategory() async {
    emit(categorloading());
    try {
      Dio dio = Dio(BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true));
      dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': tokenkey
      };
      await dio.get('categories').then((value) {
        modelcateg = Category1.fromJson(value.data);
      });
      emit(categorssuccess(model: modelcateg!));
    } on Exception catch (e) {
      emit(categorfauiler());
    }
  }

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

  void changeFavority({required int index}) {
    fav[index] = !fav[index]!;
    emit(favoritedFauileradd());
    try {
      Dio dio = Dio(BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true));
      dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': tokenkey
      };
      dio
          .post('favorites', data: {'product_id': index})
          .then((value) async {})
          .catchError((onError) {});
    } catch (e) {}
  }

  Favorites? favorites;
  void getfavorits() async {
    emit(favoritedSucessadd());
    try {
      Dio dio = Dio(BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true));
      dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': tokenkey
      };
      await dio.get('favorites').then((value) {
        favorites = Favorites.fromJson(value.data);
        print(favorites!.message);
      });
      emit(favoritedSucessadd());
    } on Exception catch (e) {
      emit(favoritedSucessadd());
    }
  }

  void getuser() async {
    try {
      Dio dio = Dio(BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true));
      dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': tokenkey
      };
      await dio.get('profile').then((value) {
        user = Usermodel.fromJson(value.data);
        print(favorites!.message);
      });
      emit(getusersuccess());
    } on Exception catch (e) {
      emit(getuserfauiler());
    }
  }

  void register({
    required String name,
    required String emil,
    required String password,
    required String phone,
  }) async {
    try {
      Dio dio = Dio(BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true));
      dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': tokenkey
      };

      await dio.post('register', data: {
        'name': name,
        'email': emil,
        'password': password,
        'phone': phone
      }).then(
        (value) {
          user = Usermodel.fromJson(value.data);
          tokenkey = user!.data!.token;
          getuser();
          print(user!.message);
        },
      );
      emit(registersuccess(user: user!));
    } on Exception catch (e) {
      emit(registerfauiler());
    }
  }
}
