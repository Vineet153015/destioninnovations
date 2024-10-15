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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.all(screenUtils.w(0.05)),
                child: AspectRatio(
                  aspectRatio: screenUtils.isPortrait ? 1 : 2,
                  child: Image.asset(
                    product.imageUrl,
                    width: screenUtils.isPortrait ? screenUtils.w(0.8) : screenUtils.w(0.6),
                    height: screenUtils.isPortrait ? screenUtils.h(0.4) : screenUtils.h(0.3),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          

              Padding(
                padding: EdgeInsets.symmetric(vertical: screenUtils.h(0.02)),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: screenUtils.sp(screenUtils.isPortrait ? 0.06 : 0.05),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          

              Padding(
                padding: EdgeInsets.symmetric(vertical: screenUtils.h(0.01)),
                child: Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: screenUtils.sp(screenUtils.isPortrait ? 0.05 : 0.04),
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          

              if (product.discount != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenUtils.h(0.01)),
                  child: Text(
                    '\$${product.discount}',
                    style: TextStyle(
                      fontSize: screenUtils.sp(screenUtils.isPortrait ? 0.045 : 0.04),
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