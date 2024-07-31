part of 'ayat_bloc.dart';

sealed class AyatState extends Equatable {
  const AyatState();

  @override
  List<Object> get props => [];
}

final class AyatInitial extends AyatState {}

final class AyatLoading extends AyatState {}

final class AyatLoaded extends AyatState {
  final List<Ayat> ayat;

  const AyatLoaded({required this.ayat});

  @override
  List<Object> get props => [ayat];
}
