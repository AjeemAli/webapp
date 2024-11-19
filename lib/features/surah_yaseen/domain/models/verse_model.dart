class Verses {
  final String id;
  final String text;
  final String translation;

  Verses({required this.id, required this.text, required this.translation});


  factory Verses.fromMap(Map<String, dynamic> map) {
    return Verses(
      id: map['id'],
      text: map['text'],
      translation: map['translation'],
    );
  }
}
