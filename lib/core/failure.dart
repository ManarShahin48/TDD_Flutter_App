abstract class Failure {
  String statusCode;
  String? message;

  Failure({
    required this.statusCode,
    this.message,
  });
}
