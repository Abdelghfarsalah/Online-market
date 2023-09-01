part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class Productsloading extends ProductsState {}
final class Productssuccess extends ProductsState {
  homeproductsmodel model;
    Productssuccess({required this.model});
}
final class Productsfauiler extends ProductsState {}

final class BottomNavBarInitial extends ProductsState {}

final class successChange extends ProductsState {}


final class categorssuccess extends ProductsState {
  Category1 model;
    categorssuccess({required this.model});
}
final class categorfauiler extends ProductsState {}

final class categorloading extends ProductsState {}

//favorites
final class favoritedSucessadd extends ProductsState {}

final class favoritedFauileradd extends ProductsState {}
final class favoritechange extends ProductsState {}

final class favoriteget extends ProductsState {}

final class getusersuccess extends ProductsState {}

final class getuserfauiler extends ProductsState {}
final class registersuccess extends ProductsState {
  Usermodel user;
  registersuccess({required this.user});
}

final class registerfauiler extends ProductsState {}
