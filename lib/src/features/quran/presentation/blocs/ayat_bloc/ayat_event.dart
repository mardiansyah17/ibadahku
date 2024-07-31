part of 'ayat_bloc.dart';

sealed class AyatEvent extends Equatable {
  const AyatEvent();

  @override
  List<Object> get props => [];
}

final class GetAyatBySurah extends AyatEvent {
  final String id;

  const GetAyatBySurah({required this.id});

  @override
  List<Object> get props => [id];
}
