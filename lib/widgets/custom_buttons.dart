import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined; // 🔹 to switch style (filled or outlined)

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.white : const Color(0xFFE53935),
          foregroundColor: isOutlined ? Colors.black : Colors.white,
          side: isOutlined
              ? const BorderSide(color: Colors.black, width: 1.5)
              : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isOutlined ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
