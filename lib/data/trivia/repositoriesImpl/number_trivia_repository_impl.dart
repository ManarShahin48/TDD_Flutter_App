import 'package:dartz/dartz.dart';
import 'package:tdd_project/core/failure.dart';
import 'package:tdd_project/domain/trivia/entities/number_trivia.dart';
import 'package:tdd_project/domain/trivia/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository{
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }

}