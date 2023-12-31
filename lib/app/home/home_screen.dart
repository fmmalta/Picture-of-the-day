import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:picture_of_the_day/app/home/cubit/picture_cubit.dart';
import 'package:picture_of_the_day/app/home/widgets/searchable_pictures_list.dart';
import 'package:picture_of_the_day/domain/use_case/fetch_image_usecase.dart';
import 'package:picture_of_the_day/domain/use_case/retrieve_latest_pictures_list_usecase.dart';
import 'package:picture_of_the_day/domain/use_case/store_latest_picture_usecase.dart';

import 'package:picture_of_the_day/service_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PictureCubit pictureCubit;

  @override
  void initState() {
    pictureCubit = PictureCubit(
        fetchImageUseCase: serviceLocator<FetchImageUseCase>(),
        storeLatestPictureUseCase: serviceLocator<StoreLatestPictureUseCase>(),
        retrieveLatestPicturesListUseCase:
            serviceLocator<RetrieveLatestPicturesListUseCase>())
      ..retrieveImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PictureCubit>(
      create: (context) => pictureCubit,
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
        body: RefreshIndicator(
          onRefresh: () => pictureCubit.forcedImageRefresh(),
          child: BlocBuilder<PictureCubit, PictureState>(
            builder: (context, state) {
              if (state is LoadingImageState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ImageRetrievedState) {
                final pictures = state.pictures.reversed.toList();
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: SearchablePicturesList(pictures),
                );
              } else {
                return ListView(
                  children: [
                    Center(
                      child: Text(state.toString()),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
