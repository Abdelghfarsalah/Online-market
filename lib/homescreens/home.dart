import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import 'package:shopapp/models/category/category.dart';
import 'package:shopapp/models/homeproductsmodel.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../models/category/datum.dart';

class homeview extends StatelessWidget {
  const homeview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return ConditionalBuilder(
              condition: BlocProvider.of<ProductsCubit>(context).model != null,
              builder: (context) => homepody(
                  category: BlocProvider.of<ProductsCubit>(context).modelcateg!,
                  model: BlocProvider.of<ProductsCubit>(context).model!),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        },
        listener: (context, state) {});
  }
}

class homepody extends StatelessWidget {
  const homepody({super.key, required this.model, required this.category});
  final homeproductsmodel model;
  final Category1 category;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: const[
                  Image(
                      image: NetworkImage(
                    'https://img.freepik.com/free-vector/cartoon-style-cafe-front-shop-view_134830-697.jpg',
                  )),
                  Image(
                      image: NetworkImage(
                    "https://media.istockphoto.com/id/666801382/photo/confused-woman-doesnt-know-what-to-buy.jpg?s=612x612&w=0&k=20&c=af6n7F1K96JHec6VgyE4dkBJyYZ9a9c4LldYWhwvuI8=",
                  )),
                ],
                options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    reverse: false,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.decelerate)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categories',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(137, 160, 14, 109)),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: category.data!.data!.length,
                  itemBuilder: (context, index) {
                    return categoryIteminhome(cat: category.data!.data![index]);
                  }),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'New Products',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(137, 160, 14, 109)),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: model.data.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 70,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) =>
                          stackProduct(model: model.data.products[index]))),
            )
          ],
        ),
      ),
    );
  }
}

class stackProduct extends StatelessWidget {
  const stackProduct({super.key, required this.model, context});
  final productsmodel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: 260,
          clipBehavior: Clip.none,
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (model.discount != 0)
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
                    Text(
                      model.name,
                      maxLines: 2,
                      style: TextStyle(fontFamily: 'OpenSans'),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "${model.price} ",
                          style: TextStyle(color: Colors.red),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (model.discount != 0)
                          Text(
                            "${model.old_price} ",
                            style: TextStyle(color: Colors.grey),
                          ),
                      const  Spacer(),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<ProductsCubit>(context)
                                  .changeFavority(index: model.id);
                              BlocProvider.of<ProductsCubit>(context)
                                  .getfavorits();
                            },
                            icon: BlocProvider.of<ProductsCubit>(context)
                                  .fav[model.id]!
                                ? const Icon(
                                  Icons.favorite,
                                    color: Color.fromARGB(255, 151, 14, 4),
                                  )
                                : const Icon(Icons.favorite))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
            right: 20,
            top: -70,
            left: 100,
            child: Image(
                height: 150, width: 150, image: NetworkImage(model.image)))
      ],
    );
  }
}

//MediaQuery.of(context).size.height*0.2,
class categoryIteminhome extends StatelessWidget {
  const categoryIteminhome({super.key, required this.cat});
  final Datum cat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: AspectRatio(
        aspectRatio: 2 / 1.2,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(cat!.image!))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                    child: Text(
                  '${cat.name}',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
