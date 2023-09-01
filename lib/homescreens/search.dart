import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubits/products/products_cubit.dart';
import 'package:shopapp/cubits/search/search_cubit.dart';

import '../models/search.dart';

class searchpage extends StatelessWidget {
  searchpage({super.key});
  String? search = 's';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/1253379369/vector/flat-vector-design-statistical-and-data-analysis-for-business-finance-investment-concept.jpg?s=170667a&w=is&k=20&c=PPPYIBH4ElIbYvQsPUCRdsn7D3RSvCGKgTRHPhRHmw4='))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      search = value;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        prefixIcon: IconButton(
                          onPressed: () {
                            print('object');
                            BlocProvider.of<SearchCubit>(context)
                                .search(word: search!);
                            //  print(BlocProvider.of<SearchCubit>(context).results!.message);
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Enter any word to search',
                        hintStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 212, 222, 223)),
                        fillColor: Colors.black.withOpacity(0.5),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(70)))),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Result',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                        const  Divider(
                                      thickness: 1,
                                      height: 3,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                          SizedBox(
                            height: 2000,
                            child: ListView.separated(
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.only(top: 10),
                                itemBuilder: (context, index) => searchitem(data: state.model.data!.data![index],),
                                separatorBuilder: (context, index) => const Divider(
                                      thickness: 1,
                                      height: 3,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                itemCount: state.model.data!.data!.length),
                          )
                        ],
                      
                    );
                  } else if (state is SearchLoading)  {
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
                  }else{
                    return const Center(child: Text('Please Search for any products'));
                  }
                })),
      ]),
    ));
  }
}

class searchitem extends StatelessWidget {
  const searchitem({super.key,required this.data});
final   Data2 data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(data!.image!))),
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
                      data.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: Row(
                      children: [
                        Text(
                          '${data.price!}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 80, 9, 3),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
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
