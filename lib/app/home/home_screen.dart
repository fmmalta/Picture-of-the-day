import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_of_the_day/app/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(RetrieveImageEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Picture Of The Day',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          shadowColor: Colors.black,
          elevation: 5,
          surfaceTintColor: Colors.white,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is LoadingImageState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ImageRetrivedState) {
              final picture = state.picture;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      picture.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: picture.url,
                        placeholder: (_, __) =>
                            const CircularProgressIndicator(),
                        errorWidget: (_, __, ___) => const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/detail',
                          arguments: picture,
                        );
                      },
                      child: const Text('Saiba mais'),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
