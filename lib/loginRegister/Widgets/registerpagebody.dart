import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp/constant.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import 'package:shopapp/homescreens/hompage.dart';

import '../loginpage.dart';
import 'customtextfiled.dart';

class registerpagebody extends StatefulWidget {
  registerpagebody({super.key});

  @override
  State<registerpagebody> createState() => _registerpagebodyState();
}

class _registerpagebodyState extends State<registerpagebody> {
  bool password = true;
  var emailcontrolar = TextEditingController();
  var passwordcontrolar = TextEditingController();
  var phonecontrolar = TextEditingController();
  var namecontrolar = TextEditingController();
  String? email;
  String? password1;
  String? phone;
  String? name;
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is registersuccess) {
          if (state.user.status!) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => homepage()),
                (route) => false);
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
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
                            height: 10,
                          ),
                          Text(
                            'Sign UP',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Log in to benefit from all our services',
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
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
                    padding: const EdgeInsets.all(5),
                    child: TextfiledF(
                        controller: namecontrolar,
                        password: false,
                        hint: 'Enter Your name',
                        icon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.near_me)),
                        onchange: (data) {
                          name = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'Please name is Required ';
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
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
                                ? const Icon(FontAwesomeIcons.userLock)
                                : const Icon(FontAwesomeIcons.user)),
                        onchange: (data) {
                          password1 = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'Please Password is Required ';
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextfiledF(
                        controller: phonecontrolar,
                        password: false,
                        hint: 'Enter PhoneNumber',
                        icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.phone_android_outlined)),
                        onchange: (data) {
                          setState(() {
                            phone = data;
                          });
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'Please Phone Number is Required ';
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<ProductsCubit>(context).register(
                              name: name!,
                              emil: email!,
                              password: password1!,
                              phone: phone!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: defultcolor,
                                  blurRadius: 10,
                                  spreadRadius: BorderSide.strokeAlignCenter,
                                  offset: Offset(0, 5))
                            ],
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromARGB(255, 234, 10, 140),
                          ),
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 50,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text(
                            'LOG In ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Color.fromARGB(255, 234, 10, 140),
                            ),
                          ))
                    ],
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
