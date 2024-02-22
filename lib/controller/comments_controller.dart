import 'package:restapiwithdio/model/CommentsModel.dart';
import 'package:restapiwithdio/model/network_response.dart';
import 'package:restapiwithdio/services/network_executor.dart';


import 'package:dio/dio.dart';
import 'package:restapiwithdio/services/urls.dart';


class CommentsController {
  final NetworkExecutor _networkExecutor;

  CommentsController() : _networkExecutor = NetworkExecutor(Dio());

  Future<List<CommentsModel>> getComments() async {
    try {
      // const String commentsEndpoint = Urls.verifyComments();

      final NetworkResponse response = await _networkExecutor.getRequest(
        path: Urls.verifyComments(),
      );

      if (response.statusCode == 200) {
        final List<dynamic> commentsJson = response.body;
        final List<CommentsModel> commentsList = commentsJson
            .map((commentJson) => CommentsModel.fromJson(commentJson))
            .toList();

        return commentsList;
      } else {
        print('Error fetching comments: ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      print('Exception while fetching comments: $e');
      return [];
    }
  }
}
