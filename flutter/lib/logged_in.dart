import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'camera.dart';

class LoggedInPage extends StatelessWidget {
  final double balance;
  const LoggedInPage({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFB8E1FF), Color(0xFF94FBAB)], 
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:45.0),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(color: Colors.black, width: 0.5)
                        ),
                        height: 75.0,
                      ),
                      Positioned(
                        left: 30.0, // Adjust this value to position the profile picture
                        top: 20.0, // Increase this value to shift the profile picture down
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              child: Icon(Icons.person), // Replace with your image url
                            ),
                            SizedBox(width: 10.0), // Add some space between the icon and the text
                            Text('Welcome to PayFace, User',
                              style: TextStyle(
                                fontFamily: 'Trajan Pro', // Replace with your font family
                                fontSize: 17.5, // Replace with your font size
                                color: Colors.black, // Replace with your color
                              ),
                            ), // Replace with your text
                            Container(
                              margin: EdgeInsets.only(left: 50.0), // Adjust this value to move the icon to the right
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2.0), // Adjust color and width as needed
                              ),
                              child: Icon(
                                Icons.notifications,
                                size: 26.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /*Expanded(
                  child: Center(
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
                            foregroundColor: Colors.black, backgroundColor: Colors.white,
                            minimumSize: Size(200, 60),
                          ),
                          child: const Text(
                            'Pay',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 32),
                        CameraButton(),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0, left:16.0),
                child: Container(
                  height: 100.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                   shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {},
                    shape: CircleBorder(),
                    elevation: 0.0,
                    child: Icon(Icons.search, color: Colors.black), // Paper airplane icon
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 270.0, left:16.0),
                child: Container(
                  height: 100.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {},
                    shape: CircleBorder(),
                    elevation: 0.0,
                    child: Icon(Icons.qr_code, color: Colors.black), // Paper airplane icon
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0, right: 20.0),
                child: Container(
                  height: 220.0, // Fixed height
                  width: 290.0, // Fixed width
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 220.0, // Same height as the outer Container
                        width: 290.0, // Same width as the outer Container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color:Colors.black, width:0.75),
                          color: Colors.white, // The background color
                          //shape: BoxShape.circle, // To make it circular like FloatingActionButton
                        ),
                      ), 
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 
                            Text('Balance:', style: TextStyle(color: Colors.black, fontSize: 35.0)), // Replace with your text
                            Text('\$$balance', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50.0)), // Replace with your text
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 365.0),
                child: Container(
                  height: 430.0, // Fixed height
                  width: 400.0, // Fixed width
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 430.0, // Same height as the outer Container
                        width: 400.0, // Same width as the outer Container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color:Colors.black, width:0.75),
                          color: Colors.white, // The background color
                        ),
                      ), 
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 20.0), // Adjust the padding as needed
                              child: Text('Past Transactions:', style: TextStyle(color: Colors.black, fontSize: 15.0)), // Replace with your text
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: 'Send',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  // Function to launch the camera app
  void _launchCameraApp() async {
    const url = 'camera://';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}