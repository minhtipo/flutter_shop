// ignore_for_file: non_constant_identifier_names

import 'package:demofashionapp/Controler/Api_Controle.dart';
import 'package:demofashionapp/Model/Article_Model.dart';
import 'package:demofashionapp/View/Compenant/Categorie_Item.dart';
import 'package:demofashionapp/View/Screens/Article_Screen.dart';
import 'package:demofashionapp/View/Screens/Cart_Screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _value = 0;

  List<String> Categorietitle = [
    "All",
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, right: 10, left: 10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.network(
                        'data:image/jpeg;base64,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',
                        height: 100,
                      ),
                      Text(
                        'MINH STORE ',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Tìm kiếm',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Nhập tên sản phẩm ',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Cart(),
                        )),
                    icon: Icon(Icons.shopping_cart))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(Categorietitle.length, (index) {
                  return MyRadioListTile<int>(
                    value: index,
                    groupValue: _value,
                    leading: Categorietitle[index],
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Article>>(
            future: _value == 0
                ? ApiControl.fetchArticle()
                : ApiControl.fetchArticleByCategorie(
                    Categorietitle[_value].toString()),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ArticlScreen(
                                            articalID:
                                                snapshot.data![index].id!,
                                          )));
                                }),
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data![index].image!),
                                                  fit: BoxFit.contain)),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            snapshot.data![index].title!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .blue),
                                                          child: Row(children: [
                                                            Text('Add to cart'),
                                                            Icon(Icons
                                                                .shopping_cart),
                                                          ])),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color: Colors.red,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color: Colors.red,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color: Colors.red,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color: Colors.red,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 20, top: 10),
                                            child: Text(
                                              'price:'
                                                      '\$' +
                                                  snapshot.data![index].price
                                                      .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 253, 104, 104),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : const Expanded(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ));
            },
          ),
        ],
      ),
    );
  }
}
