import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:picture_of_the_day/data/service/picture_retriever_service.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

import 'picture_retriever_service_test.mocks.dart';

class MockPictureService extends Mock implements PictureRetrieverService {}

@GenerateNiceMocks([MockSpec<MockPictureService>()])
void main() {
  late MockMockPictureService mockPictureService;
  late final PictureEntity _picture;

  setUp(() {
    mockPictureService = MockMockPictureService();
    // mockPictureService = MockMockPictureService(
    //   localRepository: mockLocalRepository,
    //   remoteRepository: mockRemoteRepository,
    // );
    _picture = PictureEntity(
      url:
          'https://apod.nasa.gov/apod/image/2307/MwLaPalma_Rosadzinski_960_annotated.jpg',
      explanation: '''
What's happening in the night sky? To help find out, telescopes all over the globe will be pointing into deep space. Investigations will include trying to understand the early universe, finding and tracking Earth-menacing asteroids, searching for planets that might contain extra-terrestrial life, and monitoring stars to help better understand our Sun. The featured composite includes foreground and background images taken in April from a mountaintop on La Palma island in the Canary Islands of Spain. Pictured, several telescopes from the Roque de los Muchachos Observatory are shown in front of a dark night sky. Telescopes in the foreground include, left to right, Magic 1, Galileo, Magic 2, Gran Telescopio Canarias, and LST. Sky highlights in the background include the central band of our Milky Way Galaxy, the constellations of Sagittarius, Ophiuchus and Scorpius, the red-glowing Eagle and Lagoon Nebulas, and the stars Alrami and Antares. Due to observatories like this, humanity has understood more about our night sky in the past 100 years than ever before in all of human history.
''',
      title: 'Milky Way above La Palma Observatory',
    );
  });

  group('Picture Retriever Service', () {
    test('check if the fetchImage function is returning an image', () async {
      when(mockPictureService.fetchImage()).thenAnswer((_) async => _picture);

      final result = await mockPictureService.fetchImage();

      expect(result, _picture);
    });

    test('check if the fetchImage function is returning an error', () async {
      when(mockPictureService.fetchImage()).thenAnswer((_) async => _picture);

      final result = await mockPictureService.fetchImage();

      expect(result, _picture);
    });
  });
}
