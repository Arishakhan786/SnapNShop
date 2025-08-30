import 'package:flutter/material.dart';
import 'package:frehas_task/visual%20search/media_services.dart';
import 'package:frehas_task/widgets/custom_buttons.dart';

class VisualSearchScreen extends StatelessWidget {
  const VisualSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcY_EJ7GXRgdF0ZgqHwJ0Nzm1iZdNadBNHHg&s",
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.4)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Search for an outfit by taking a photo or uploading an image",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 20),

                // TAKE A PHOTO -> real camera
                CustomButton(
                  text: "TAKE A PHOTO",
                  onPressed: () async {
                    final path = await MediaService.pickFromCamera();
                    if (path != null && context.mounted) {
                      Navigator.pushNamed(
                        context,
                        '/TakePhotoScreen', // your existing route
                        arguments: path, // pass image path forward
                      );
                    }
                  },
                ),
                const SizedBox(height: 15),

                // UPLOAD AN IMAGE -> real gallery
                CustomButton(
                  text: "UPLOAD AN IMAGE",
                  isOutlined: true, // your updated button supports this
                  onPressed: () async {
                    final path = await MediaService.pickFromGallery();
                    if (path != null && context.mounted) {
                      Navigator.pushNamed(
                        context,
                        '/FindingResultsScreen', // keep your route
                        arguments: path,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
