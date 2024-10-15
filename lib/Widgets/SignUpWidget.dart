import 'package:flutter/material.dart';
import '../ScreenSize/screenUtils.dart';

class SignupForm extends StatelessWidget {
  final ScreenUtils screenutils;

  SignupForm({required this.screenutils});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Email TextField
          TextField(
            decoration: InputDecoration(
              labelText: 'Email Address',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: screenutils.h(0.02)),

          // Password TextField
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          SizedBox(height: screenutils.h(0.02)),

          // Password TextField
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: '123-456-789 (Optional)',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          SizedBox(height: screenutils.h(0.02)),

          // Password TextField
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: screenutils.h(0.02)),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility), // Toggle visibility
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          SizedBox(height: screenutils.h(0.02)),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Location',
              prefixIcon: Icon(Icons.location_on),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: screenutils.h(0.02)),


          // Login Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: screenutils.h(0.02)),
              backgroundColor: Colors.green, // Login button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // Login button logic
            },
            child: Center(
              child: Text(
                'SignUp',
                style: TextStyle(
                  fontSize: screenutils.sp(0.02),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
