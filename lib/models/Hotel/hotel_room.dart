import 'package:equatable/equatable.dart';

class HotelRoom extends Equatable {
  final String id;
  String title;
  String description;
  String image;
  String price;
  List<dynamic> features;

  HotelRoom({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.features = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'room_id': id,
      'title': title,
      'image': image,
      'features': features,
      'price': price,
      'description': description,
    };
  }

  factory HotelRoom.fromJson(Map<String, dynamic> map) {
    return HotelRoom(
      id: map['room_id'] ?? '',
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      image: map['image'] ?? "",
      price: map['price'] ?? "",
      features: (map['features'] != null) ? map['features'] : [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
        features,
        price,
      ];
}
