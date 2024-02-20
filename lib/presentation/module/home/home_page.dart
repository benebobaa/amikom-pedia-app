import 'package:amikompedia_app/presentation/module/home/widgets/feeds_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: FeedsItem(),
              ),
          separatorBuilder: ((context, index) => Divider(
                color: Colors.grey,
                thickness: 0.4,
              )),
          itemCount: 5),
    );
  }
}
