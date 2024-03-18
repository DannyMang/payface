import 'package:flutter/material.dart';
import 'package:payface/logged_in.dart';
import 'package:payface/register.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // or WidgetsApp
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Payface',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: '', // Removed text
                    border: InputBorder.none, // Removes border
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: const UnderlineInputBorder(
                      // Adds underline
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // Keeps underline while typing
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .primary), // Or any color you prefer
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: '', // Removed text
                    border: InputBorder.none, // Removes border
                    prefixIcon: const Icon(Icons.lock),
                    enabledBorder: const UnderlineInputBorder(
                      // Adds underline
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // Keeps underline while typing
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .primary), // Or any color you prefer
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add your sign-in validation logic here
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => LoggedInPage(balance: 0.00,)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add your sign-in validation logic here
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const RegisterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
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
