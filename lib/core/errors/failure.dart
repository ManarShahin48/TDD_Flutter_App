import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // String? statusCode;
  // String? message;
  //
  // Failure({
  //   this.statusCode,
  //   this.message,
  // });
}

// import 'package:equatable/equatable.dart';
//
// abstract class Failure extends Equatable {
//   // const Failure([List properties = const <dynamic>[]]) : super(properties);
// }

// General failures
class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
