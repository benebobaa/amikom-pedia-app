import 'package:amikompedia_app/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/post_bloc/post_state.dart';
import 'package:amikompedia_app/presentation/module/home/widgets/feeds_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: FeedsItem(),
                  ),
              separatorBuilder: ((context, index) => Divider(
                    color: Colors.grey,
                    thickness: 0.4,
                  )),
              itemCount: 5);
        },
        listener: (context, state) {
          if (state.status == PostStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
      ),
    );
  }
}
