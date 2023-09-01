import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shopapp/constant.dart';
import 'package:shopapp/models/responseloginmodel.dart';

import '../../models/usermodel/usermodel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  late resposemodel model;
  var diod = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true));
  Future loginfunction(
      {required String email, required String password}) async {
    emit(Loginloading());
    try {
      await diod.post('login',
          data: {'email': email, 'password': password}).then((value) async {
        model = resposemodel.fromjson(value.data);

        tokenkey = model.data!.token;
        await getuser();
        print(tokenkey);
      });

      emit(LoginSuccess(model: model));
    } on Exception catch (e) {
      emit(Loginfauiler());
    }
  }

  Future<void> getuser() async {
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
      });

      emit(getusersu());
    } on Exception catch (e) {
      emit(getuserfau());
    }
  }
}
