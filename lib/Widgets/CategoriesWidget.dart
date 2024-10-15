import 'package:destioninnovations/ScreenSize/screenUtils.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget{

  final String productName;
  final String imagePath;

  const Categories(
      {
        super.key,
        required this.productName,
        required this.imagePath
      }
      );


  @override
  Widget build(BuildContext context) {

    final screenUtil = ScreenUtils(context);

    return Container(
      height: screenUtil.h(0.12),
      width: screenUtil.w(0.25),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            children: [

              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenUtil.h(0.05),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Text(
                      productName,
                      style: TextStyle(
                        fontSize: screenUtil.sp(0.035),
                        color: Colors.white,
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