import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/splash_bloc/splash_state.dart';
import 'package:amikompedia_app/presentation/pages/splash_page.dart';

import '../../helpers/bloc_mocks.dart';



void main() {
  late MockSplashBloc mockSplashBloc;

  setUp(() {
    mockSplashBloc = MockSplashBloc();
  });

  Widget makeTestAbleWidget(Widget body) {
    return BlocProvider<SplashBloc>(
      create: (context) => mockSplashBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'should show adaptive dialog when state is [SplashLocationDenied]',
      (widgetTester) async {
    //arrange
    when(() => mockSplashBloc.state).thenReturn(SplashLocationDenied());

    //act
    await widgetTester.pumpWidget(makeTestAbleWidget(const SplashPage()));
    await widgetTester.pumpAndSettle();
    //assert
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
