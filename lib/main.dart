import 'package:beauty_app/views/productDetail/view/product_detail_page.dart';
import 'package:beauty_app/views/searchProduct/view/searchView.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white70),
      title: 'Material App',
      home: ProductDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
