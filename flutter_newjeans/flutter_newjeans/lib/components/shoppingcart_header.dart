import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';
import 'product_selector_button.dart';

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({Key? key}) : super(key: key);

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/minji.jpg",
    "assets/hanni.jpg",
    "assets/danielle.jpg",
    "assets/haerin.jpg",
    "assets/hyein.jpg"
  ];

  List<String> iconImages = [
    "assets/minji_icon.png",
    "assets/hanni_icon.png",
    "assets/danielle_icon.png",
    "assets/haerin_icon.png",
    "assets/hyein_icon.png"
  ];

  List<Color> iconColors = [
    kMinjiSelectedColor,
    kHanniSelectedColor,
    kDanielleSelectedColor,
    kHaerinSelectedColor,
    kHyeinSelectedColor,
  ];

  void changeIcon(int id) {
    setState(() {
      selectedId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return ProductSelectorButton(
            id: index,
            selectedIconNum: selectedId,
            mImage: iconImages[index],
            changeIcon: changeIcon,
            backgroundColor: iconColors[index],
          );
        }),
      ),
    );
  }
}
