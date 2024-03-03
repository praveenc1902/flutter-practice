part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{

}

class HomeProductWishListButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProducts;

  HomeProductWishListButtonClickedEvent({required this.clickedProducts});

}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProducts;

  HomeProductCartButtonClickedEvent({required this.clickedProducts});

}

class HomeWishListButtonNavigateEvent extends HomeEvent{


}

class HomeCartButtonNavigateEvent extends HomeEvent{

}
