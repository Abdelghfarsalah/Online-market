import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import 'package:shopapp/models/category/datum.dart';

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductsCubit>(context);
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                height: 1,
                endIndent: 20,
                indent: 20,
              );
            },
            itemCount: cubit.modelcateg!.data!.data!.length,
            itemBuilder: (context, index) {
              return categoryitemmod(
                  model: cubit.modelcateg!.data!.data![index]);
            },
          ),
        );
      },
    );
  }
}

class categoryitemmod extends StatelessWidget {
  const categoryitemmod({super.key, required this.model});
  @override
  final Datum model;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage("${model.image}")??
                      NetworkImage("https://letsenhance.io/static/15912da66660b919112b5dfc9f562f6f/f90fb/SC.jpg"))),
            ),
            SizedBox(width: 2),
            Text(
              '${model.name}',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  fontFamily: 'OpenSans'),
              maxLines: 2,
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_right,
                  size: 50,
                ))
          ],
        ),
      ),
    );
  }
}
