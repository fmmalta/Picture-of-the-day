import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:picture_of_the_day/data/picture_repository_impl/picture_local_repository_impl.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

import 'local_repository_impl_test.mocks.dart';

class MockLocalRepository extends Mock implements LocalRepositoryImpl {}

final List<PictureEntity> _picture = [
  PictureEntity(
    url:
        'https://apod.nasa.gov/apod/image/2307/MwLaPalma_Rosadzinski_960_annotated.jpg',
    explanation: '''
What's happening in the night sky? To help find out, telescopes all over the globe will be pointing into deep space. Investigations will include trying to understand the early universe, finding and tracking Earth-menacing asteroids, searching for planets that might contain extra-terrestrial life, and monitoring stars to help better understand our Sun. The featured composite includes foreground and background images taken in April from a mountaintop on La Palma island in the Canary Islands of Spain. Pictured, several telescopes from the Roque de los Muchachos Observatory are shown in front of a dark night sky. Telescopes in the foreground include, left to right, Magic 1, Galileo, Magic 2, Gran Telescopio Canarias, and LST. Sky highlights in the background include the central band of our Milky Way Galaxy, the constellations of Sagittarius, Ophiuchus and Scorpius, the red-glowing Eagle and Lagoon Nebulas, and the stars Alrami and Antares. Due to observatories like this, humanity has understood more about our night sky in the past 100 years than ever before in all of human history.
''',
    title: 'Milky Way above La Palma Observatory',
    date: DateTime.now(),
  )
];

@GenerateNiceMocks([MockSpec<MockLocalRepository>()])
void main() {
  group('Picture of the day local response', () {
    test('check if the picture is been stored', () async {
      final localRepository = MockMockLocalRepository();
      when(localRepository.storeLatestPictureList(_picture))
          .thenAnswer((_) async => true);

      final response = await localRepository.storeLatestPictureList(_picture);

      expect(response, true);
    });

    test('check if the picture is been retrieved', () async {
      final localRepository = MockMockLocalRepository();
      when(localRepository.retrieveLatestPicturesList())
          .thenAnswer((_) async => _picture);

      final response = await localRepository.retrieveLatestPicturesList();

      expect(response, _picture);
    });

    test('check if the list is empty if there is not picture stored', () async {
      final localRepository = MockMockLocalRepository();
      when(localRepository.retrieveLatestPicturesList())
          .thenAnswer((_) async => []);

      final response = await localRepository.retrieveLatestPicturesList();

      expect(response, isEmpty);
    });
  });
}
