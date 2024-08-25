class HomeModel {
  final bool status;
  final List<Banners> banners;
  final List<Products> products;

  HomeModel(
      {required this.status, required this.banners, required this.products});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        status: json['status'],
        banners: (json['data']['banners'] as List)
            .map((e) => Banners.fromJson(e))
            .toList(),
        products: (json['data']['products'] as List)
            .map((e) => Products.fromJson(e))
            .toList());
  }
}

class Banners {
  final int id;
  final String image;

  Banners({
    required this.id,
    required this.image,
  });

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      id: json['id'],
      image: json['image'],
    );
  }
}

class Products {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String image;
  final String name;
  final bool inFavorites;
  final bool inCart;

  Products(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.inFavorites,
      required this.inCart,
    });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'].toDouble(),
        image: json['image'],
        name: json['name'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
    );
  }
}
