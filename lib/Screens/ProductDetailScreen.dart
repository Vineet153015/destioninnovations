import 'package:destioninnovations/ScreenSize/screenUtils.dart';
import 'package:flutter/material.dart';
import '../Widgets/ProductGridWidget.dart';



class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {

    final screenUtils = ScreenUtils(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers the column content
            children: [
              // Image - Adjust size and layout based on orientation
              Padding(
                padding: EdgeInsets.all(screenUtils.w(0.05)), // 5% of the screen width padding
                child: AspectRatio(
                  aspectRatio: screenUtils.isPortrait ? 1 : 2, // Square in portrait, wider in landscape
                  child: Image.asset(
                    product.imageUrl,
                    width: screenUtils.isPortrait ? screenUtils.w(0.8) : screenUtils.w(0.6), // Image width based on orientation
                    height: screenUtils.isPortrait ? screenUtils.h(0.4) : screenUtils.h(0.3), // Image height based on orientation
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              // Product name with responsive font size and layout based on orientation
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenUtils.h(0.02)), // 2% vertical padding
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: screenUtils.sp(screenUtils.isPortrait ? 0.06 : 0.05), // Font size larger in portrait mode
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          
              // Product price with responsive font size based on orientation
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenUtils.h(0.01)), // 1% vertical padding
                child: Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: screenUtils.sp(screenUtils.isPortrait ? 0.05 : 0.04), // Font size smaller in landscape
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          
              // Discounted price with responsive font size (if any)
              if (product.discount != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenUtils.h(0.01)), // 1% vertical padding
                  child: Text(
                    '\$${product.discount}',
                    style: TextStyle(
                      fontSize: screenUtils.sp(screenUtils.isPortrait ? 0.045 : 0.04), // Adjust based on orientation
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}