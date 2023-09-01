import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp/constant.dart';
import 'package:shopapp/cubits/login/login_cubit.dart';
import 'package:shopapp/helper/sharedpref.dart';
import 'package:shopapp/homescreens/hompage.dart';

import 'customtextfiled.dart';

class loginpagebody extends StatefulWidget {
  loginpagebody({super.key});

  @override
  State<loginpagebody> createState() => _loginpagebodyState();
}

class _loginpagebodyState extends State<loginpagebody> {
  bool password = true;
  var key = GlobalKey<FormState>();
  var emailcontrolar = TextEditingController();
  var passwordcontrolar = TextEditingController();
  String? email;
  String? password1;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          if (state.model.status) {
            Fluttertoast.showToast(
                msg: state.model.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            helper.savedata(key: 'token', value: state.model.data!.token);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => homepage()),
                (route) => false);
          } else {
            Fluttertoast.showToast(
                msg: state.model.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(0),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 234, 10, 140),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Please Login to take advantage of all our products',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextfiledF(
                        controller: emailcontrolar,
                        password: false,
                        hint: 'Enter Your Email',
                        icon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.email)),
                        onchange: (data) {
                          email = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'Please Email is Required ';
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextfiledF(
                        controller: passwordcontrolar,
                        password: password,
                        hint: 'Enter Your Password',
                        icon: IconButton(
                            onPressed: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            icon: password
                                ? Icon(FontAwesomeIcons.userLock)
                                : Icon(FontAwesomeIcons.user)),
                        onchange: (data) {
                          password1 = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'Please Password is Required ';
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          cubit.loginfunction(
                              email: email!, password: password1!);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: defultcolor,
                                blurRadius: 10,
                                spreadRadius: BorderSide.strokeAlignCenter,
                                offset: const Offset(0, 5))
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 234, 10, 140),
                        ),
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Center(
                            child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontFamily: 'RobotoSlab',
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'You already have an account ? ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign Up ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Color.fromARGB(255, 234, 10, 140),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
/*const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: defultcolor),
                  ),
                  const Text(
                    'Please Login to take advantage of all our products',
                    style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  */
