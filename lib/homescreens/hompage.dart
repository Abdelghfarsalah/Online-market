import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import 'package:shopapp/homescreens/search.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<ProductsCubit>(context);
        return BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                  title: const Text(
                    'Your market',
                    style: TextStyle(
                        color: Color.fromARGB(255, 133, 64, 77), fontSize: 30),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => searchpage(),));
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 133, 64, 77),
                          size: 30,
                        ))
                  ]),
              body: cubit.screens[cubit.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                  elevation: 0,
                  selectedItemColor: const Color.fromARGB(255, 194, 93, 93),
                  iconSize: 30,
                  unselectedItemColor: Colors.grey,
                  showUnselectedLabels: true,
                  currentIndex: cubit.currentindex,
                  backgroundColor: Colors.white,
                  onTap: (value) {
                    cubit.changeview(index: value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.house), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.apps), label: 'Category'),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.heart), label: 'Favorite'),
                    BottomNavigationBarItem(
                        icon: Icon(FontAwesomeIcons.gear), label: 'Settings'),
                  ]),
            );
          },
        );
      },
    );
  }
}
