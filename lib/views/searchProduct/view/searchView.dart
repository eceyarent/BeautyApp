// ignore_for_file: file_names

import 'package:beauty_app/views/searchProduct/model/product.dart';
import 'package:beauty_app/widgets/card_widgets.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.1),
        child: _appBar(),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searcBar(size),
            const SizedBox(height: 20),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Found 10 Results',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 3),
                children: List.generate(
                  productList.length,
                  (index) => CardWidget(product: productList[index]),
                ),
              ),
            ),
          ]),
    );
  }

  Row searcBar(Size size) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: size.width * 0.7,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Cleansers",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                fillColor: const Color(0xffe6e6ec),
                filled: true,
              ),
            ),
          ),
        ),
        Container(
          width: size.height * 0.07,
          height: size.height * 0.07,
          decoration: BoxDecoration(
            color: const Color(0xffe6e6ec),
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune),
          ),
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
      leadingWidth: 60,
      backgroundColor: Colors.transparent,
      title:
          const Text('Search Product', style: TextStyle(color: Colors.black)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/profil.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
