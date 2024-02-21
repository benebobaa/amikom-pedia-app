import 'package:amikompedia_app/domain/usecases/post_usecase.dart';
import 'package:amikompedia_app/presentation/bloc/login_bloc/login_event.dart';
import 'package:amikompedia_app/presentation/bloc/post_bloc/post_event.dart';
import 'package:amikompedia_app/presentation/bloc/post_bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUsecase _usecase;
  PostBloc(this._usecase) : super(const PostState()) {
    on<OnGetPosts>(_onGetPosts);
  }

  Future<void> _onGetPosts(OnGetPosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    final result = await _usecase.getPosts();
    result.fold(
      (failure) => emit(state.copyWith(
        status: PostStatus.failure,
        message: failure.message,
      )),
      (postEntity) => emit(state.copyWith(
        status: PostStatus.success,
        posts: postEntity,
      )),
    );
  }
}
