class CustomProductModel {
  List<String> image;
  String title;
  String description;
  double price;
  CustomProductModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });
}

CustomProductModel customProduct = CustomProductModel(
  image: [
    'assets/images/image1.png',
    'assets/images/image1.png',
    'assets/images/image1.png',
  ],
  title: 'Focial Cleanser',
  description: 'Citrus refreshes sensers',
  price: 16.2,
);
