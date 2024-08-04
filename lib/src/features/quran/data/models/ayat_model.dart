import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';

class AyatModel extends Ayat {
  AyatModel({
    required super.id,
    required super.number,
    required super.arab,
    required super.audio,
    required super.latin,
    required super.terjemahan,
    super.noteNumber,
    super.noteText,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) {
    return AyatModel(
      id: json['id'],
      number: json['ayah'],
      arab: json['arab'],
      audio: json['audio'],
      latin: json['latin'],
      terjemahan: json['text'],
      noteNumber: json['notes']?.toString().substring(0, 2),
      noteText: json['notes']
          ?.toString()
          .substring(3, json['notes'].toString().length),
    );
  }
}
