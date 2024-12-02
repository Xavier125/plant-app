class Plant {
  final int id;
  final String name;
  final double price;
  final String description;
  final int rating;

  Plant({
    required this.id,
    required this.name,
    required this.price,
    this.description = '',
    this.rating = 0,
  });
}
