import 'package:flutter/material.dart';

import '../Screens/ProductDetailScreen.dart';

class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double? discount;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.discount,
  });
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 3 : 2, // Responsive columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: isTablet ? 0.8 : 0.7, // Adjust aspect ratio
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
              child: MouseRegion(
                onEnter: (_) {},
                onExit: (_) {},
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 18 : 16,
                                fontFamily: 'MonaSans'
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(
                                    fontSize: isTablet ? 16 : 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                if (product.discount != null)
                                  Text(
                                    '\$${product.discount}',
                                    style: TextStyle(
                                      fontSize: isTablet ? 14 : 12,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}