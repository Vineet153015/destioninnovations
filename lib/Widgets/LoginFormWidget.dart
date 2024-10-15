import 'package:destioninnovations/Screens/productScreen.dart';
import 'package:flutter/material.dart';
import '../ScreenSize/screenUtils.dart';

class LoginForm extends StatelessWidget {
  final ScreenUtils screenutils;

  LoginForm({required this.screenutils});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

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


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Remember me'),
                ],
              ),
              TextButton(
                onPressed: () {

                },
                child: Text('Forgot Password?'),
              ),
            ],
          ),
          SizedBox(height: screenutils.h(0.03)),


          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: screenutils.h(0.02)),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductScreen()),
              );
            },
            child: Center(
              child: Text(
                'Login',
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
