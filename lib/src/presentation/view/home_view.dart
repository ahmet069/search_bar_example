import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_bar_example/main.dart';
import 'package:search_bar_example/src/config/app_router.dart';
import 'package:search_bar_example/src/core/components/post_widget/post_widget.dart';
import 'package:search_bar_example/src/core/components/text_form_field/custom_text_form_field.dart';
import 'package:search_bar_example/src/data/model/post_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final dio = Dio();

class _HomeViewState extends State<HomeView> {
  List<PostModel> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      final postsJson =
          response.data as List<dynamic>; //? list<dynamic> important
      setState(
        () {
          _posts = postsJson.map((json) => PostModel.fromJson(json)).toList();
        },
      );
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 70.h,
        title: CustomTextFromField(
          isReadOnly: true,
          onTap: () => router.push(SearchRoute()),
        ),
      ),
      body: Container(
        width: 1000.w,
        height: 1000.h,
        color: Color(0xffe3e3e3),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];
            return PostWidget(
              id: int.parse(post.id.toString()),
              title: post.title.toString(),
              description: post.body.toString(),
            );
          },
        ),
      ),
    );
  }
}
