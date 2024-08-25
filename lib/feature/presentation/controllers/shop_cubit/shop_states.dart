abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class BottomNavState extends ShopStates {}

/// home states

class HomeSuccessState extends ShopStates {}

class HomeErrorState extends ShopStates {
  final String error;

  HomeErrorState(this.error);
}

/// categories states

class CategoriesSuccessState extends ShopStates {}

class CategoriesErrorState extends ShopStates {
  final String error;

  CategoriesErrorState(this.error);
}

/// add to favorite
class AddToFavLoadingState extends ShopStates {}

class AddToFavSuccessState extends ShopStates {}

class AddToFavErrorState extends ShopStates {
  final String error;

  AddToFavErrorState(this.error);
}

/// get favorite list

class GetFavSuccessState extends ShopStates {}

class GetFavErrorState extends ShopStates {
  final String error;

  GetFavErrorState(this.error);
}

