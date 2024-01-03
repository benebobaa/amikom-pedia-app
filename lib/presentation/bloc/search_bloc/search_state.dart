

import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class RecentSearchEmpty extends SearchState {}

class RecentSearchLoaded extends SearchState {
  final List<String> locations;

  const RecentSearchLoaded({required this.locations});

  @override
  List<Object> get props => [locations];
}

