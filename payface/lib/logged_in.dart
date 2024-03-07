import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoggedInPage extends StatelessWidget {
  final double balance;

  const LoggedInPage({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Balance:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              '\$$balance',
              style: const  TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _launchCameraApp();
              },
              child: const Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch the camera app DOESNT WORK!!!!!!!!
  void _launchCameraApp() async {
    const url = 'camera://'; // This is a placeholder URL
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
