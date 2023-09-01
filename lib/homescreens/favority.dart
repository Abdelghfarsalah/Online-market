import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import '../models/favorites/datum.dart';

class favority extends StatelessWidget {
  const favority({super.key});

  @override
  Widget build(BuildContext context) {
    var cubti = BlocProvider.of<ProductsCubit>(context);
    return BlocConsumer<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if(cubti.favorites!.data==null||cubti.favorites==null||cubti.favorites!.data!.data==null)
        {
          return const Center(
            child: Text('There are no favorite products', style:  TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),),
          ); 
        }else{
          
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: cubti.favorites!.data!.data!.length,
          itemBuilder: (context, index) {
            return favoritesitem(model: cubti.favorites!.data!.data![index]);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 2,
              height: 2,
              endIndent: 20,
              indent: 20,
            );
          },
        );
      
        }
      },
      listener: (context, state) {},
    );
  }
}

class favoritesitem extends StatelessWidget {
  const favoritesitem({super.key, required this.model});
  final Datu model;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(model.product!.image!)??
                                            NetworkImage("https://letsenhance.io/static/15912da66660b919112b5dfc9f562f6f/f90fb/SC.jpg"),

                      )),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      model.product!.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (model.product!.discount != 0)
                    Container(
                      child: Center(
                          child: Text(
                        "discount",
                        style: TextStyle(color: Colors.white),
                      )),
                      height: 20,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromARGB(255, 80, 9, 3)),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: Row(
                      children: [
                        Text(
                          "${model.product!.price!}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 80, 9, 3),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        if (model.product!.discount != 0)
                          Text(
                            "${model.product!.price!}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 80, 9, 3),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<ProductsCubit>(context)
                                  .changeFavority(index: model.product!.id!);
                              BlocProvider.of<ProductsCubit>(context)
                                  .getfavorits();
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: const Color.fromARGB(255, 147, 23, 14),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
