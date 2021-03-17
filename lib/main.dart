import 'package:flutter/material.dart';


import 'model/product.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = List<Product>();
    Product product = Product(0, "asset/intro_img.png");
    products.add(product);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    return products.map((products) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(aspectRatio: 18/11,
              child: Image.asset(
                  products.name,
                  fit: BoxFit.fitWidth
              ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        products.name,
                        style: theme.textTheme.caption,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
            ),
          ],
        ),
      );
    }).toList();
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                semanticLabel: 'menu',
              ),
              onPressed: () {
                print('Menu button');
              },
            ),
            title: Text('SHRINE'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'search',
                )
                ,
                onPressed: () {
                  print('Search button');
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.tune,
                  semanticLabel: 'filter',
                ),
                onPressed: () {
                  print('Filter button');
                },
              ),
            ],
          ),
          body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context),
          ),
          resizeToAvoidBottomInset: false,
      )
    );
  }
}