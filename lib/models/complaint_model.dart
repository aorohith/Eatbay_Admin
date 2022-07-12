class Complaint {
  String orderId;
  String userId;
  bool isClosed;
  List<String> images;
  String userName;
  String description;

  Complaint({
    required this.orderId,
    required this.userId,
    required this.isClosed,
    required this.images,
    required this.userName,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'user_id': userId,
        'is_closed': isClosed,
        'images': images,
        'user_name': userName,
        'description': description,
      };

  static Complaint fromJson(Map<String, dynamic> json) => Complaint(
        orderId: json['order_id'],
        userId: json['user_id'],
        isClosed: json['is_closed'],
        images: json['images'],
        userName: json['user_name'],
        description: json['description'],
      );
}
