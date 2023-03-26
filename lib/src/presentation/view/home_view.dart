import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_bar_example/main.dart';
import 'package:search_bar_example/src/config/app_router.dart';
import 'package:search_bar_example/src/core/components/post_widget/post_widget.dart';
import 'package:search_bar_example/src/core/components/text_form_field/custom_text_form_field.dart';
import 'package:search_bar_example/src/data/model/post_model.dart';
import 'package:search_bar_example/src/data/model/user_model.dart';
import 'package:search_bar_example/src/presentation/bloc/post/post_bloc.dart';
import 'package:search_bar_example/src/presentation/widget/home/indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final dio = Dio();

class _HomeViewState extends State<HomeView> {
  late List<UserModel> users;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
    users = [];
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (_isBottom) context.read<PostBloc>()..add(const PostFetched());
  }

  bool get _isBottom {
    //* Is there an object it controls
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * .9);
    //* 10% near the end of the page
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _fetchUsers() async {
    try {
      final response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      final usersJson = response.data as List<dynamic>;
      setState(() {
        users = usersJson.map((json) => UserModel.fromJson(json)).toList();
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (_) => PostBloc(
        client: HttpClient(),
      )..add(PostFetched()), //* for first fetch
      child: Scaffold(
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, postState) {
            switch (postState.status) {
              case PostStatus.err:
                return Center(
                  child: Text('Someting went wrong'),
                );
              case PostStatus.succes:
                if (postState.posts.isEmpty) {
                  return const Center(
                    child: Text('isEmty'),
                  );
                }
                ;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return index >= postState.posts.length
                        ? Indicator()
                        : PostWidget(
                            post: postState.posts[index],
                          );
                  },
                  itemCount: postState.hasReachedMax
                      ? postState.posts.length
                      : postState.posts.length + 1,
                );
              default:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('coming..'), CircularProgressIndicator()],
                  ),
                );
            }
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 70.h,
          title: CustomTextFromField(
            isReadOnly: true,
            onTap: () => router.push(SearchRoute()),
          ),
        ),
      ),
    );
  }
}
