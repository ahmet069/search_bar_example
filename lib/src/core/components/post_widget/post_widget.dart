import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:search_bar_example/src/data/model/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(post.body.toString()),
    );
  }
}
