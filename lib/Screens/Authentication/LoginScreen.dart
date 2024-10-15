import 'dart:ui';
import 'package:flutter/material.dart';
import '../../ScreenSize/screenUtils.dart';
import '../../Widgets/LoginFormWidget.dart';
import '../../Widgets/SignUpWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // For 2 tabs: Login and Signup
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenutils = ScreenUtils(context);

    final double horizontalPadding = screenutils.isTablet
        ? screenutils.w(screenutils.isPortrait ? 0.1 : 0.15)
        : screenutils.w(screenutils.isPortrait ? 0.05 : 0.07);
    final double verticalPadding = screenutils.isTablet
        ? screenutils.h(screenutils.isPortrait ? 0.06 : 0.05)
        : screenutils.h(screenutils.isPortrait ? 0.05 : 0.04);
    final double titleFontSize = screenutils.isTablet
        ? screenutils.sp(screenutils.isPortrait ? 0.08 : 0.06)
        : screenutils.sp(screenutils.isPortrait ? 0.10 : 0.08);
    final double subtitleFontSize = screenutils.isTablet
        ? screenutils.sp(screenutils.isPortrait ? 0.04 : 0.02)
        : screenutils.sp(screenutils.isPortrait ? 0.05 : 0.04);
    final double containerWidth = screenutils.isTablet
        ? screenutils.w(screenutils.isPortrait ? 0.9 : 0.7)
        : screenutils.w(screenutils.isPortrait ? 1 : 0.85);
    final double containerHeight =
        screenutils.isPortrait ? screenutils.h(0.5) : screenutils.h(0.7);

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: Colors.white, size: screenutils.w(0.08)),
          onPressed: () {},
        ),
        SizedBox(height: verticalPadding),
        Text(
          "Go ahead and set up your account",
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFontSize,
            fontFamily: 'MonaSans-Black',
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        SizedBox(height: screenutils.h(0.02)),
        Text(
          "Sign up to enjoy the best shopping experience",
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
            fontFamily: 'MonaSans',
          ),
        ),
        SizedBox(height: verticalPadding),
        Center(
          child: Container(
            width: containerWidth,
            height: containerHeight,
            padding: EdgeInsets.all(screenutils.w(0.04)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(screenutils.w(0.04)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TabBar
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.green,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: subtitleFontSize),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: subtitleFontSize),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenutils.h(0.04)),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      LoginForm(screenutils: screenutils),
                      SignupForm(screenutils: screenutils),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenutils.w(1),
            height: screenutils.h(1),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: screenutils.isPortrait
                  ? content
                  : SingleChildScrollView(
                      child: content,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
