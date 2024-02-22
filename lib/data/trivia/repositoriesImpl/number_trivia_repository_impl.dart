import 'package:dartz/dartz.dart';
import 'package:tdd_project/core/errors/failure.dart';
import 'package:tdd_project/domain/trivia/entities/number_trivia.dart';
import 'package:tdd_project/domain/trivia/repositories/number_trivia_repository.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/platform/internet_info.dart';
import '../datasource/number_trivia_local_data_source.dart';
import '../datasource/number_trivia_remote_data_source.dart';
import '../models/number_trivia_model.dart';

typedef _ConcreteOrRandomChooser = Future<NumberTrivia> Function();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  // @override
  // Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
  //   // TODO: implement getConcreteNumberTrivia
  //   networkInfo.isConnected;
  //   return const Right(NumberTriviaModel(text: '', number: 1));
  // }
  //
  // @override
  // Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
  //   // TODO: implement getRandomNumberTrivia
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
    int number,
  ) async {
    return await _getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia as NumberTriviaModel);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
