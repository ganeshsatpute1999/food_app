part of 'sidedrawer_bloc.dart';

sealed class SidedrawerState extends Equatable {
  const SidedrawerState();
  
  @override
  List<Object> get props => [];
}

final class SidedrawerInitial extends SidedrawerState {}
