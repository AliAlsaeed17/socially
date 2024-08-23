class ListModel<T> {
  final List<T> items;

  ListModel({required this.items});

  factory ListModel.fromJson(Map<String, dynamic> jsonData,
      T Function(Map<String, dynamic> jsonData) modelFromJson) {
    return ListModel(
      items: jsonData['posts'] is List
          ? (jsonData['posts'] as List)
              .map((data) => modelFromJson(data))
              .toList()
          : [],
    );
  }
}
