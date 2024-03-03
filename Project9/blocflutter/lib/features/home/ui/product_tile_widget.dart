import 'package:blocflutter/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

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
                    homeBloc.add(HomeProductWishListButtonClickedEvent(clickedProducts: productDataModel));
                  }, icon: Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    homeBloc.add(HomeProductCartButtonClickedEvent(clickedProducts: productDataModel));
                  }, icon: Icon(Icons.shopping_bag_outlined))
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
