import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_event.dart';
import 'package:amikompedia_app/presentation/bloc/search_bloc/search_state.dart';
import 'package:amikompedia_app/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:amikompedia_app/presentation/pages/search_page.dart';

import '../../helpers/bloc_mocks.dart';
import '../../helpers/constants/test_weather_data.dart';

void main() {
  late MockSearchBloc mockSearchBloc;
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockSearchBloc = MockSearchBloc();
    mockWeatherBloc = MockWeatherBloc();
  });

  Widget makeTestAbleWidget(Widget body) {
    return MultiBlocProvider(providers: [
      BlocProvider<SearchBloc>(
        create: (context) => mockSearchBloc,
      ),
      BlocProvider<WeatherBloc>(
        create: (context) => mockWeatherBloc,
      ),
    ], child: MaterialApp(home: body));
  }

  testWidgets('when form submitted auto pop back to [WeatherPage]',
      (widgetTester) async {
    //arrange
    when(() => mockSearchBloc.state).thenReturn(RecentSearchEmpty());

    //act
    await widgetTester.pumpWidget(makeTestAbleWidget(const SearchPage()));
    await widgetTester.enterText(find.byType(TextFormField), 'London');
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);
    await widgetTester.pumpAndSettle();

    //assert
    expect(find.byType(SearchPage), findsNothing);
  });

  testWidgets('should show [AlertDialog] when submitted empty form',
      (widgetTester) async {
    //arrange
    when(() => mockSearchBloc.state).thenReturn(RecentSearchEmpty());

    //act

    await widgetTester.pumpWidget(makeTestAbleWidget(const SearchPage()));
    await widgetTester.enterText(find.byType(TextFormField), '');
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);
    await widgetTester.pumpAndSettle();

    //assert
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('should show [ListView] when state is [RecentSearchLoaded]',
      (widgetTester) async {
    //arrange
    when(() => mockSearchBloc.state)
        .thenReturn(const RecentSearchLoaded(locations: testRecentLocations));

    //act
    await widgetTester.pumpWidget(makeTestAbleWidget(const SearchPage()));
    await widgetTester.pumpAndSettle();

    //assert
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('should delete the correct element of clicked',
      (widgetTester) async {
    //arrange
    when(() => mockSearchBloc.state)
        .thenReturn(const RecentSearchLoaded(locations: testRecentLocations));

    //act
    await widgetTester.pumpWidget(makeTestAbleWidget(const SearchPage()));
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byIcon(Icons.delete).first);
    await widgetTester.pumpAndSettle();

    //assert
    verify(() => mockSearchBloc
        .add(OnDeleteRecentLocation(name: testRecentLocations[0])));
  });
}
