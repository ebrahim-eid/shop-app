/// add and remove to favorite
class AddFavoriteModel{
  final bool status;
  final String message;
  final Map<String,dynamic> ?data;

  AddFavoriteModel({required this.status, required this.message,required this.data});
  factory AddFavoriteModel.fromJson(Map<String,dynamic>json){
    return AddFavoriteModel(
        status: json['status'],
        message: json['message'],
        data: json['data']
    );
  }

}

/// get favorite
class GetFavoriteModel{
  final bool status;
  final String ?message;
  final List<GetFavoriteModelProductData> ? data;

  GetFavoriteModel({required this.status, required this.message, required this.data});
  factory GetFavoriteModel.fromJson(Map<String, dynamic> json) {
    return GetFavoriteModel(
        status: json['status'],
        message: json['message'],
        data: (json['data']['data'] as List).map((e)=>GetFavoriteModelProductData.fromJson(e)).toList()
    );
  }
}
class GetFavoriteModelProductData{
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String image;
  final String name;

  GetFavoriteModelProductData({required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name
  });
  factory GetFavoriteModelProductData.fromJson(Map<String, dynamic> json) {
    return GetFavoriteModelProductData(
      id: json['product']['id'],
      price: json['product']['price'].toDouble(),
      oldPrice: json['product']['old_price'].toDouble(),
      discount: json['product']['discount'].toDouble(),
      image: json['product']['image'],
      name: json['product']['name'],
    );
  }
}