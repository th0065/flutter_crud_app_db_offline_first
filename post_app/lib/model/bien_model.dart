class Bien {
  final int? id;
  final String titre;
  final String description;
  final double prix;

  Bien({
    this.id,
    required this.titre,
    required this.description,
    required this.prix,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'prix': prix,
    };
  }

  factory Bien.fromMap(Map<String, dynamic> map) {
    return Bien(
      id: map['id'],
      titre: map['titre'],
      description: map['description'],
      prix: map['prix'],
    );
  }
}