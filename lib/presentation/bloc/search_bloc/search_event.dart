
import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}


class OnCacheSearchLocation extends SearchEvent {
  final String name;

  const OnCacheSearchLocation({required this.name});

  @override
  List<Object> get props => [name];
}

class OnInitCacheLocations extends SearchEvent {
  const OnInitCacheLocations();

  @override
  List<Object> get props => [];
}

class OnDeleteRecentLocation extends SearchEvent {
  final String name;

  const OnDeleteRecentLocation({required this.name});

  @override
  List<Object> get props => [name];
}