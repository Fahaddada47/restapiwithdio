import 'package:flutter/material.dart';
import 'package:restapiwithdio/controller/comments_controller.dart';
import 'package:restapiwithdio/model/CommentsModel.dart';

class HomePage extends StatelessWidget {
  final CommentsController commentsController;

  HomePage({required this.commentsController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: FutureBuilder<List<CommentsModel>>(
        future: commentsController.getComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No comments available.'),
            );
          } else {
            final List<CommentsModel> comments = snapshot.data!;
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index].name  ?? ''),
                  subtitle: Text(comments[index].body ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}