import 'package:flutter/material.dart';
import 'package:frehas_task/visual%20search/media_services.dart';
import '../widgets/custom_appbar.dart';

class TakePhotoScreen extends StatelessWidget {
  const TakePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search by taking a photo"),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://i.ibb.co/4dR0yDt/outfit.jpg",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.photo_library,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final path = await MediaService.pickFromGallery();
                      if (path != null && context.mounted) {
                        Navigator.pushNamed(
                          context,
                          '/CropItemScreen',
                          arguments: path,
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 50),
                  IconButton(
                    icon: const Icon(Icons.camera, size: 60, color: Colors.red),
                    onPressed: () async {
                      final path = await MediaService.pickFromCamera();
                      if (path != null && context.mounted) {
                        Navigator.pushNamed(
                          context,
                          '/CropItemScreen',
                          arguments: path,
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 50),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Reset photo and try again."),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
