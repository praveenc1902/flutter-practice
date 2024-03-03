import 'package:blocflutter/features/home/ui/product_tile_widget.dart';
import 'package:blocflutter/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    homebloc.add(HomeInitialEvent());
  }


  final HomeBloc homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc : homebloc,
      listenWhen: (previous,current)  => current is HomeActionState ,
      buildWhen: (previous,current) => current is !HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        }
        else if (state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
        else if (state is HomeProductsItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Items Wishlisted"),
          ));
        }
        else if (state is HomeProductsItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added to Cart')));
        }
        else if(state is HomeProductsItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to Wishlist')));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState  = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text("Avatar Groceries App"),
                actions: [
                  IconButton(onPressed: (){
                    homebloc.add(HomeWishListButtonNavigateEvent());
                  }, icon: Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    homebloc.add(HomeCartButtonNavigateEvent());
                  }, icon: Icon(Icons.shopping_cart))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index){
                    return ProductTileWidget(productDataModel: successState.products[index], homeBloc: homebloc,);
                  }),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error Loading the page"),
              ),
            );
          default:
            return SizedBox();
        }

      },
    );
  }
}
