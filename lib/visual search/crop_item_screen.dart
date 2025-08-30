import 'package:flutter/material.dart';
import 'package:frehas_task/widgets/custom_buttons.dart';
import '../widgets/custom_appbar.dart';

class CropItemScreen extends StatelessWidget {
  const CropItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // image path passed from previous screen
    final imagePath = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: const CustomAppBar(title: "Crop the item"),
      body: Stack(
        fit: StackFit.expand,
        children: [
          imagePath != null
              ? Image.network(imagePath, fit: BoxFit.cover) // or File if local
              : Image.network(
                  "https://i.ibb.co/4dR0yDt/outfit.jpg",
                  fit: BoxFit.cover,
                ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                text: "FIND RESULTS", // ✅ fixed empty button
                onPressed: () =>
                    Navigator.pushNamed(context, '/findingResults'),
                isOutlined: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
