import 'package:digishop/api/api_caller.dart';
import 'package:digishop/models/category.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future<List<Category?>> catList = ApiCaller().getCategories();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Category?>>(
          future: catList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 199,
                          child: Card(
                            child: Column(
                              children: [





                                Image.network(
                                  snapshot.data![index]!.icon,
                                  height: 160, width: width,fit: BoxFit.cover,
                                ),
                                Center(
                                  child:
                                      Text('${snapshot.data![index]!.title}'),
                                )
                              ],
                            ),
                          ),
                        );
                      }));
            } else if (snapshot.hasError) {
              return Text('${snapshot.hasError}');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
