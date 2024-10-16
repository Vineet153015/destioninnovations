import 'package:flutter/material.dart';

import '../ScreenSize/screenUtils.dart';


class UserInfoCard extends StatelessWidget {
  final String userName;
  final String userLocation;
  final String cartItemCount;
  final ScreenUtils screenUtils;

  const UserInfoCard({
    required this.userName,
    required this.userLocation,
    required this.cartItemCount,
    required this.screenUtils,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenUtils.h(0.02),
        horizontal: screenUtils.w(0.04),
      ),
      child: Container(
        height: screenUtils.isTablet ? 100 : 90,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenUtils.isTablet ? 15.0 : 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: screenUtils.sp(screenUtils.isTablet ? 0.02 : 0.05),
                        fontFamily: 'monaSans/MonaSans-Black.ttf',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenUtils.h(0.001)),
                    Text(
                      userLocation,
                      style: TextStyle(
                        fontSize: screenUtils.sp(screenUtils.isTablet ? 0.012 : 0.025),
                        fontFamily: 'monaSans/MonaSans-SemiBold.ttf',
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: screenUtils.w(screenUtils.isTablet ? 0.025 : 0.06),
                          color: Colors.green,
                        ),
                        SizedBox(width: screenUtils.w(0.01)),
                        Text(
                          cartItemCount,
                          style: TextStyle(
                            fontSize: screenUtils.sp(screenUtils.isTablet ? 0.025 : 0.07),
                            fontFamily: 'monaSans/MonaSans-SemiBold.ttf',
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SearchBarCard Widget
class SearchBarCard extends StatelessWidget {
  final Function(String) updateSearchQuery;
  final ScreenUtils screenUtils;

  const SearchBarCard({
    required this.updateSearchQuery,
    required this.screenUtils,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenUtils.h(0.02),
        horizontal: screenUtils.w(0.04),
      ),
      child: Container(
        height: screenUtils.isTablet ? 60 : 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenUtils.isTablet ? 12.0 : 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search, size: screenUtils.isTablet ? 20.0 : 20),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenUtils.h(screenUtils.isTablet ? 0.01 : 0.01),
                ),
              ),
              onChanged: updateSearchQuery,
            ),
          ),
        ),
      ),
    );
  }
}
