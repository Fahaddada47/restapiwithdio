import 'package:flutter/material.dart';
import 'package:restapiwithdio/controller/comments_controller.dart';
import 'package:restapiwithdio/ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommentsController commentsController = CommentsController();

    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(commentsController: commentsController),
    );
  }
}
