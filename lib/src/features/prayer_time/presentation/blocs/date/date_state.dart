part of 'date_bloc.dart';

sealed class DateState extends Equatable {
  const DateState();
  
  @override
  List<Object> get props => [];
}

final class DateInitial extends DateState {}
