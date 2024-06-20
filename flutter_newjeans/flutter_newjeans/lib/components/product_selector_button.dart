import 'package:flutter/material.dart';

class ProductSelectorButton extends StatelessWidget {
  final int id;
  final int selectedIconNum;
  final String mImage;
  final Function(int) changeIcon;
  final Color backgroundColor;

  const ProductSelectorButton({
    Key? key,
    required this.id,
    required this.selectedIconNum,
    required this.mImage,
    required this.changeIcon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeIcon(id),
      child: Container(
        decoration: BoxDecoration(
          color: selectedIconNum == id ? backgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          mImage,
          width: 65.0,
          height: 65.0,
        ),
      ),
    );
  }
}
