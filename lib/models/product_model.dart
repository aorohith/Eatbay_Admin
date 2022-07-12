class Product {
  String id;
   String name;
   double price;
   String description;
  String imageUrl;

  Product({
    this.id = '',
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'imageUrl': imageUrl,
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        imageUrl: json['imageUrl'],
      );
      // birthday:(json['birthday'] as Timestamp).toDate();
}
