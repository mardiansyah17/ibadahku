part of 'ayat_bloc.dart';

sealed class AyatState extends Equatable {
  const AyatState();
  
  @override
  List<Object> get props => [];
}

final class AyatInitial extends AyatState {}
