import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_bar_example/src/data/model/user_model.dart';

import '../../core/components/text_form_field/custom_text_form_field.dart';
import '../../data/model/post_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<UserModel> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 70.h,
        title: CustomTextFromField(
          isReadOnly: false,
        ),
      ),
      body: Container(
        width: 1000.w,
        height: 1000.h,
        color: Color(0xffe3e3e3),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Container();
            }),
      ),
    );
  }
}
