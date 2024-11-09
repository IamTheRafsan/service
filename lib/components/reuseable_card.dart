import 'package:flutter/material.dart';
import 'package:service/ui/Styles.dart';

class CatergoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final VoidCallback onTap; // Ensure onTap is a VoidCallback

  const CatergoryCard({
    super.key,
    required this.imagePath,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          width: 80,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(categoryName, style: BodyText.bodyText()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
