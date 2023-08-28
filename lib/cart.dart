import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      height: double.infinity,
      image: NetworkImage(
          'https://images.pexels.com/photos/2486168/pexels-photo-2486168.jpeg?cs=srgb&dl=pexels-roberto-nickson-2486168.jpg&fm=jpg'),
    );
  }
}
