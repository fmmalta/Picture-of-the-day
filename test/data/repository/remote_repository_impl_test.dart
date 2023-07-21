import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:picture_of_the_day/data/picture_repository_impl/picture_remote_repository_impl.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

import 'remote_repository_impl_test.mocks.dart';

class MockRemoteRepository extends Mock implements RemoteRepositoryImpl {}

final List<PictureEntity> _pictures = [
  PictureEntity(
      url:
          'https://apod.nasa.gov/apod/image/2307/MwLaPalma_Rosadzinski_960_annotated.jpg',
      explanation: '''
What's happening in the night sky? To help find out, telescopes all over the globe will be pointing into deep space. Investigations will include trying to understand the early universe, finding and tracking Earth-menacing asteroids, searching for planets that might contain extra-terrestrial life, and monitoring stars to help better understand our Sun. The featured composite includes foreground and background images taken in April from a mountaintop on La Palma island in the Canary Islands of Spain. Pictured, several telescopes from the Roque de los Muchachos Observatory are shown in front of a dark night sky. Telescopes in the foreground include, left to right, Magic 1, Galileo, Magic 2, Gran Telescopio Canarias, and LST. Sky highlights in the background include the central band of our Milky Way Galaxy, the constellations of Sagittarius, Ophiuchus and Scorpius, the red-glowing Eagle and Lagoon Nebulas, and the stars Alrami and Antares. Due to observatories like this, humanity has understood more about our night sky in the past 100 years than ever before in all of human history.
''',
      title: 'Milky Way above La Palma Observatory',
      date: DateTime.now())
];

@GenerateNiceMocks([MockSpec<MockRemoteRepository>()])
void main() {
  group('Picture Of The Day Response', () {
    test('checking if the response returns a picture entity object', () async {
      final remoteRepository = MockMockRemoteRepository();
      when(remoteRepository.fetchImages()).thenAnswer((_) async => _pictures);

      final result = await remoteRepository.fetchImages();

      expect(result, isNotNull);
    });

    test('checking if the picture entity object title is not empty', () async {
      final remoteRepository = MockMockRemoteRepository();
      when(remoteRepository.fetchImages()).thenAnswer((_) async => _pictures);

      final result = await remoteRepository.fetchImages();

      expect(result.first.title, isNotEmpty);
      expect(result.first.title, 'Milky Way above La Palma Observatory');
    });

    test('checking if the picture entity object url is not empty', () async {
      final remoteRepository = MockMockRemoteRepository();
      when(remoteRepository.fetchImages()).thenAnswer((_) async => _pictures);

      final result = await remoteRepository.fetchImages();

      expect(result.first.url, isNotEmpty);
      expect(
        result.first.url,
        'https://apod.nasa.gov/apod/image/2307/MwLaPalma_Rosadzinski_960_annotated.jpg',
      );
    });

    test('checking if the picture entity object explanation is not empty',
        () async {
      final remoteRepository = MockMockRemoteRepository();
      when(remoteRepository.fetchImages()).thenAnswer((_) async => _pictures);

      final result = await remoteRepository.fetchImages();

      expect(result.first.explanation, isNotEmpty);
      expect(
        result.first.explanation,
        '''
What's happening in the night sky? To help find out, telescopes all over the globe will be pointing into deep space. Investigations will include trying to understand the early universe, finding and tracking Earth-menacing asteroids, searching for planets that might contain extra-terrestrial life, and monitoring stars to help better understand our Sun. The featured composite includes foreground and background images taken in April from a mountaintop on La Palma island in the Canary Islands of Spain. Pictured, several telescopes from the Roque de los Muchachos Observatory are shown in front of a dark night sky. Telescopes in the foreground include, left to right, Magic 1, Galileo, Magic 2, Gran Telescopio Canarias, and LST. Sky highlights in the background include the central band of our Milky Way Galaxy, the constellations of Sagittarius, Ophiuchus and Scorpius, the red-glowing Eagle and Lagoon Nebulas, and the stars Alrami and Antares. Due to observatories like this, humanity has understood more about our night sky in the past 100 years than ever before in all of human history.
''',
      );
    });

    test('throws an exception if the http call completes with an error',
        () async {
      final remoteRepository = MockMockRemoteRepository();
      when(remoteRepository.fetchImages())
          .thenAnswer((_) => throw ArgumentError());

      expect(() => remoteRepository.fetchImages(), throwsArgumentError);
    });
  });
}
