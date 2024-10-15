import 'package:flutter/material.dart';
import 'package:destioninnovations/ScreenSize/screenUtils.dart';

class Categories extends StatelessWidget {
  final String productName;
  final String imagePath;

  const Categories({
    super.key,
    required this.productName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtils(context);

    // Check if the device is in portrait mode
    bool isPortrait = screenUtil.isPortrait;

    return Container(
      // Adjust height and width based on orientation
      height: isPortrait ? screenUtil.h(0.15) : screenUtil.h(0.30),
      width: isPortrait ? screenUtil.w(0.35) : screenUtil.w(0.25),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenUtil.sp(12.0)), // Responsive corner radius
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenUtil.sp(12.0)), // Responsive corner radius for the Image
          child: Stack(
            children: [
              // Image that covers the entire card
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              // Positioned gradient at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: isPortrait ? screenUtil.h(0.05) : screenUtil.h(0.10), // Adjusted gradient height for orientation
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent, // Fully transparent at the top
                        Colors.black.withOpacity(0.7), // Darker gradient at the bottom
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isPortrait ? screenUtil.w(0.02) : screenUtil.w(0.015),  // Adjusted padding for orientation
                      vertical: isPortrait ? screenUtil.h(0.01) : screenUtil.h(0.008),    // Adjusted padding for orientation
                    ),
                    child: Text(
                      productName,
                      style: TextStyle(
                        fontSize: isPortrait ? screenUtil.sp(16) : screenUtil.sp(12), // Adjusted font size for orientation
                        color: Colors.black, // Text color
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
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
