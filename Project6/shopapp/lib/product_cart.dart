import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final Color backgroundColor;
  const ProductCard(
      {
        super.key,
        required this.title,
        required this.price,
        required this.image,
        required this.backgroundColor
      }
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
        color: Color.fromRGBO(216, 240, 253, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
            style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 5,),
            Text('\$$price',
            style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 5,),
            Center(
              child: Image(
                height: 175,
                image:AssetImage(image),
              ),
            )
          ],
        ),
      ),
    );
  }
}

