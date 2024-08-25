class CategoriesModel{
  final bool status;
  final int currentPage;
  final List<CategoriesData> data;

  CategoriesModel({required this.status, required this.currentPage, required this.data});

  factory CategoriesModel.fromJson(Map<String,dynamic>json){
    return CategoriesModel(
        status: json['status'],
        currentPage: json['data']['current_page'],
        data: (json['data']['data'] as List).map((e)=>CategoriesData.fromJson(e)).toList()
    );
  }
}

class CategoriesData{
  final int id;
  final String name;
  final String image;

  CategoriesData({required this.id, required this.name, required this.image});
  factory CategoriesData.fromJson(Map<String,dynamic>json){
    return CategoriesData(
        id: json['id'],
        name: json['name'],
        image: json['image']
    );
  }
}