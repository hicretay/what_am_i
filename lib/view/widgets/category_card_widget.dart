import 'package:flutter/material.dart';

class CategoryCardWidget extends StatefulWidget {
  const CategoryCardWidget({super.key, required this.image, required this.onTap});

  final String image;
  final VoidCallback onTap;

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: (MediaQuery.of(context).size.width - 32) / 2,
          height: (MediaQuery.of(context).size.height - 32) / 3,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
