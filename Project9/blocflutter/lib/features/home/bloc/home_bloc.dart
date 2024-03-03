import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocflutter/data/cart_items.dart';
import 'package:blocflutter/data/grocery_data.dart';
import 'package:blocflutter/data/wishlist_item.dart';
import 'package:blocflutter/features/home/ui/home.dart';
import 'package:meta/meta.dart';

import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent> (homeInitialEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeProductWishListButtonClickedEvent>(homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    

  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("cart clicked");
    emit(HomeNavigateToCartPageActionState());
  }


  FutureOr<void> homeWishListButtonNavigateEvent(HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  Future<FutureOr<void>> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(GroceryData.groceryProducts.map((e) => ProductDataModel(
        e['id'],
        e['name'],
        e['description'],
        e['price'],
        e['imageUrl'])).toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Home Product Wishlist event");
    wishlistItems.add(event.clickedProducts);
    emit(HomeProductsItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Home Product Cart event");
    cartItems.add(event.clickedProducts);
    emit(HomeProductsItemCartedActionState());
  }
}
