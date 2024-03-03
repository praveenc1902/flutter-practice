import 'package:blocflutter/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color:Colors.black38),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit:BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl)
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productDataModel.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    // cartBloc.add(HomeProductWishListButtonClickedEvent(clickedProducts: productDataModel));
                  }, icon: Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    cartBloc.add(CartRemoveFromCartEvent(productDataModel));
                  }, icon: Icon(Icons.shopping_bag))
                ],
              )
            ],
          ),
          Text(productDataModel.description,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
              )
          ),
          Text('\$ ${productDataModel.price}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold
              )
          )
        ],
      ),
    );
  }
}
