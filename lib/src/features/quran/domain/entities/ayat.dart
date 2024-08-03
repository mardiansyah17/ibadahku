class Ayat {
  final String arab;
  final String audio;
  final String id;
  final String latin;
  final String terjemahan;
  final String? noteNumber;
  final String? noteText;

  Ayat({
    required this.arab,
    required this.audio,
    required this.id,
    required this.latin,
    required this.terjemahan,
    this.noteNumber,
    this.noteText,
  });
}
