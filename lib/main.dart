import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picture_of_the_day/app/detail/detail_screen.dart';
import 'package:picture_of_the_day/app/home/home_screen.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(
                  builder: (context) => const HomeScreen());
            }
            if (settings.name == '/detail') {
              final args = settings.arguments as PictureEntity;
              return MaterialPageRoute(
                builder: (context) => DetailScreen(picture: args),
              );
            }
            return null;
          },
        );
      },
    );
  }
}
