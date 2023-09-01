import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/constant.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import 'package:shopapp/helper/sharedpref.dart';
import 'package:shopapp/loginRegister/loginpage.dart';
import 'package:shopapp/loginRegister/registerPage.dart';

class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<ProductsCubit>(context);
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Color.fromARGB(255, 136, 24, 16)),
              child: Center(
                  child: Text(
                '${user!.data!.name!}',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.email,
                      size: 30,
                      color: Color.fromARGB(255, 12, 123, 154),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      '${user!.data!.email!}',
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.phone,
                      size: 30,
                      color: Color.fromARGB(255, 12, 123, 154),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      '${user!.data!.phone!}',
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              height: 5,
              endIndent: 10,
              indent: 10,
              color: Colors.black,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  tokenkey = '';
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => registerPage()),
                      (route) => false);
                },
                child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.red.withOpacity(0.1)),
                    child: const Center(
                        child: Text(
                      'LogOut',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ))),
              ),
            ),
          ],
        );
      },
    );
  }
}
