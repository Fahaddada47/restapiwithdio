class Urls {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyComments() => '$_baseUrl/comments';



}
