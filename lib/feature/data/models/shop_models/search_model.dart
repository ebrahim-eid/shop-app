class SearchModel {
  final bool status;
  final List<SearchDataModel> data;

  SearchModel({required this.status, required this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(status: json['status'],
        data: (json['data']['data'] as List).map((e)=>SearchDataModel.fromJson(e)).toList()
    );
  }
}

class SearchDataModel {
  final int id;
  final double price;
  final String image;
  final String name;
  final bool inFavorites;

  SearchDataModel(
      {required this.price,
      required this.image,
      required this.name,
      required this.inFavorites,required this.id
      });

  factory SearchDataModel.fromJson(Map<String, dynamic> json) {
    return SearchDataModel(
      price: json['price'].toDouble(),
      image: json['image'],
      name: json['name'],
      inFavorites: json['in_favorites'],
      id: json['id']
    );
  }
}
