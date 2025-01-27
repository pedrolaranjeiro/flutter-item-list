import 'dart:convert';

class Item {
  
  String title;
  String description;

  Item({
    required this.title,
    required this.description,
  });

  
  Item copyWith({
    String? title,
    String? description,
  }) {
    return Item(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() => 'Item(title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
