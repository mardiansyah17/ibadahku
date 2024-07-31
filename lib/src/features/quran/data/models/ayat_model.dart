import 'package:ibadahku/src/features/quran/domain/entities/ayat.dart';

class AyatModel extends Ayat {
  AyatModel({
    required super.arab,
    required super.audio,
    required super.id,
    required super.latin,
    required super.terjemahan,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) {
    return AyatModel(
      arab: json['arab'],
      audio: json['audio'],
      id: json['ayah'],
      latin: json['latin'],
      terjemahan: json['text'],
    );
  }
}
