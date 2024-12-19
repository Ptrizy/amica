class Pet {
  final String breed;
  final String description;
  final String image;
  final bool isMale;
  final String nama;
  final String registered;
  final String title;

  Pet({
    required this.breed,
    required this.description,
    required this.image,
    required this.isMale,
    required this.nama,
    required this.registered,
    required this.title,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      breed: json['breed'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      isMale: json['isMale'] ?? false,
      nama: json['nama'] ?? '',
      registered: json['registered'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
