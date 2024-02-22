import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_project/domain/trivia/entities/number_trivia.dart';
import 'package:tdd_project/domain/trivia/repositories/number_trivia_repository.dart';
import 'package:tdd_project/domain/trivia/usecases/get_concrete_number_trivia_usecase.dart';
import 'package:mockito/annotations.dart';
import 'get_concrete_number_trivia_test.mocks.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

@GenerateMocks([MockNumberTriviaRepository])
void main() {
  late GetConcreteNumberTriviaUseCase useCase;
  late MockMockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockMockNumberTriviaRepository();
    useCase = GetConcreteNumberTriviaUseCase(repository: mockNumberTriviaRepository);
  });

  const tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
        () async {
      /// arrange
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
          .thenAnswer((_) async => Right(tNumberTrivia));
      /// act
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await useCase(const Params(number: tNumber));
      /// assert
      // useCase should simply return whatever was returned from the Repository
      expect(result, Right(tNumberTrivia));
      // Verify that the method has been called on the Repository
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
