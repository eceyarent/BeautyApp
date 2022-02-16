import 'package:beauty_app/views/productDetail/model/customProductModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> images = [
    'assets/images/natural.png',
    'assets/images/natural2.png',
    'assets/images/vegan.png'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: size * 0.05,
        child: _appBar(),
      ),
      body: Column(
        children: [
          carouselSlider(),
          littleCards(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        height: 175,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Facial Cleanser',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(Icons.star),
                    ),
                  ),

                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Row littleCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => littleCard(images[index]),
      ),
    );
  }

  CarouselSlider carouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(height: 350.0),
      items: customProduct.image.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(
                    i,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    customProduct.image.length,
                    (index) =>
                        _buildItemWidget(index, customProduct.image.indexOf(i)),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget littleCard(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }

  Container _buildItemWidget(int index, int i) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: i == index ? Colors.red : Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
      leadingWidth: 60,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.catching_pokemon,
          ),
        )
      ],
    );
  }
}
