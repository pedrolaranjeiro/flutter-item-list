class Item {
  
  String title;
  String description;

  Item({
    required this.title,
    required this.description,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

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
