import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraButton extends StatelessWidget {
  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
  }

  Future<void> _openCamera() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await _requestCameraPermission();
      status = await Permission.camera.status;
      if (!status.isGranted) {
        // Handle the case where the user did not grant the permission
        return;
      }
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    print("opened camera");

    if (pickedFile != null) {
      // Do something with the image file
    } else {
      // Handle when no image is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _openCamera,
      child: Text('Open Camera'),
    );
  }
}