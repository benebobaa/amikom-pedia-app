import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amikompedia_app/core/constants/key.dart';
import 'package:amikompedia_app/domain/usecases/weather_usecase.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_event.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WeatherUsecase _usecase;
  SearchBloc(this._usecase) : super(RecentSearchEmpty()) {
    on<OnCacheSearchLocation>((event, emit) {
      _cacheNewLocations(event.name);
    });

    on<OnInitCacheLocations>((event, emit) async {
      final result = await _usecase.getRecentLocations(Key.recentLocations);
      result.fold((failure) => null,
          (data) => emit(RecentSearchLoaded(locations: data)));
    });

    on<OnDeleteRecentLocation>((event, emit) async {
      final result = await _usecase.getRecentLocations(Key.recentLocations);
      result.fold((failure) => null, (data) {
        if (data.contains(event.name)) {
          data.remove(event.name);
        }
        _usecase.cacheRecentLocations(Key.recentLocations, data);
        emit(RecentSearchLoaded(locations: data));
      });
    });
  }

  void _cacheNewLocations(String name) async {
    final result = await _usecase.getRecentLocations(Key.recentLocations);
    result.fold((failure) => null, (data) {
      if (data.contains(name)) {
        data.remove(name);
      }
      List<String> newLocations = data;
      newLocations.add(name);
      _usecase.cacheRecentLocations(Key.recentLocations, newLocations);
    });
  }
}
