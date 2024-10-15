import 'dart:ui';
import 'package:flutter/material.dart';
import '../../ScreenSize/screenUtils.dart';
import '../../Widgets/LoginFormWidget.dart';
import '../../Widgets/SignUpWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // For 2 tabs: Login and Signup
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenutils = ScreenUtils(context);

    // Variables that adjust based on tablet/phone and orientation
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
    final double containerHeight = screenutils.isPortrait ? screenutils.h(0.5) : screenutils.h(0.7);

    // Wrap content in SingleChildScrollView if landscape to prevent overflow
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button
        IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: screenutils.w(0.08)),
          onPressed: () {
            // Back navigation logic
          },
        ),
        SizedBox(height: verticalPadding),

        // Main title text
        Text(
          "Go ahead and set up your account",
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFontSize, // Adjusted font size for tablet and phone
            fontFamily: 'MonaSans-Black',
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),

        SizedBox(height: screenutils.h(0.02)),

        // Subtitle text
        Text(
          "Sign up to enjoy the best shopping experience",
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize, // Adjusted font size for tablet and phone
            fontFamily: 'MonaSans',
          ),
        ),

        SizedBox(height: verticalPadding),

        // Expanded Widget for Tab Container
        Center(
          child: Container(
            width: containerWidth, // Adjust width based on device and orientation
            height: containerHeight, // Adjust height based on orientation
            padding: EdgeInsets.all(screenutils.w(0.04)), // Adjust padding for tablet and phone
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(screenutils.w(0.04)), // Adjust corner radius
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TabBar
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.green, // Color for the active tab indicator
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: subtitleFontSize), // Adjust font size for tablet and phone
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: subtitleFontSize),
                        // Adjust font size for tablet and phone
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenutils.h(0.04)),

                // Expanded TabBarView for content switching
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Login Form Tab
                      LoginForm(screenutils: screenutils),
                      // Signup Form Tab
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
          // Background Image
          Container(
            width: screenutils.w(1),
            height: screenutils.h(1),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), // Path to your image
                fit: BoxFit.cover, // Ensures the image covers the entire background
              ),
            ),
          ),

          // Blur effect over the image
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust the blur intensity
              child: Container(
                color: Colors.black.withOpacity(0), // Keeps it transparent while applying blur
              ),
            ),
          ),

          // Foreground content (Icons and other widgets)
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding), // Adjust padding based on screen size
              child: screenutils.isPortrait
                  ? content
                  : SingleChildScrollView( // Use SingleChildScrollView in landscape mode
                child: content,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
