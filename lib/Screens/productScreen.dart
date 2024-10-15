import 'package:destioninnovations/ScreenSize/screenUtils.dart';
import 'package:destioninnovations/Widgets/CategoriesWidget.dart';
import 'package:flutter/material.dart';
import '../Widgets/ProductGridWidget.dart';
import '../Widgets/UserNameandSearchBarWidget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'assets/images/p1.jpg', price: 100.0, discount: 80.0),
    Product(name: 'Product 2', imageUrl: 'assets/images/p2.jpg', price: 150.0),
    Product(name: 'Product 3', imageUrl: 'assets/images/p1.jpg', price: 150.0),
    Product(name: 'Product 4', imageUrl: 'assets/images/p2.jpg', price: 150.0),
    Product(name: 'Product 5', imageUrl: 'assets/images/p1.jpg', price: 80.0, discount: 80.0),
    Product(name: 'Product 6', imageUrl: 'assets/images/p2.jpg', price: 200.0, discount: 80.0),
  ];

  List<Product> filteredProducts = [];

  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initially show all products
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = products
          .where((product) => product.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenUtils = ScreenUtils(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Screen'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User info section
            UserInfoCard(
              userName: 'UserName',
              userLocation: 'User Location',
              cartItemCount: '02',
              screenUtils: screenUtils,
            ),
            // Search bar section
            SearchBarCard(
              updateSearchQuery: updateSearchQuery,
              screenUtils: screenUtils,
            ),
            // Horizontal categories scrollable row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Categories(productName: 'Fruits', imagePath: 'assets/images/fruits.jpg'),
                  Categories(productName: 'BreakFast', imagePath: 'assets/images/breakfast.jpg'),
                  Categories(productName: 'Meals', imagePath: 'assets/images/meal.jpg'),
                  Categories(productName: 'Snacks', imagePath: 'assets/images/snack.jpg'),
                  Categories(productName: 'Vegtables', imagePath: 'assets/images/vegetables.jpg'),
                  Categories(productName: 'Frozen', imagePath: 'assets/images/frozen.jpg'),
                  Categories(productName: 'Ready', imagePath: 'assets/images/bg.jpg'),
                ],
              ),
            ),
            // Product grid with fixed height to make it scrollable within the page
            SizedBox(
              height: screenUtils.h(0.5), // Adjust height based on your layout
              child: ProductGrid(
                products: filteredProducts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
