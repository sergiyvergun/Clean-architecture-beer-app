import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton(
      {Key? key, required this.selected, required this.onPressed})
      : super(key: key);
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(selected ? Icons.bookmark : Icons.bookmark_border_outlined));
  }
}
