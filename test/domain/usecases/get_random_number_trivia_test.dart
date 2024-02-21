import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_project/core/usecase.dart';
import 'package:tdd_project/domain/trivia/entities/number_trivia.dart';
import 'package:tdd_project/domain/trivia/repositories/number_trivia_repository.dart';
import 'package:tdd_project/domain/trivia/usecases/get_concrete_number_trivia_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:tdd_project/domain/trivia/usecases/get_random_number_trivia_usecase.dart';
import 'get_concrete_number_trivia_test.mocks.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

@GenerateMocks([MockNumberTriviaRepository])
void main() {
  late GetRandomNumberTriviaUseCase useCase;
  late MockMockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockMockNumberTriviaRepository();
    useCase = GetRandomNumberTriviaUseCase(repository: mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia from the repository',
        () async {
      // arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await useCase(NoParams());
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
