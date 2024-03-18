import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'camera.dart';

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
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _launchCameraApp();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.white, // Change text color to black
                minimumSize: Size(200, 60), // Set button size
              ),
              child: const Text(
                'Pay',
                style: TextStyle(fontSize: 20), // Set text size
              ),
            ),
             const SizedBox(height: 32),
            CameraButton(),
                  
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
