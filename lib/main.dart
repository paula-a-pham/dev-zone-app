import 'package:dev_zone/core/constants/app_strings.dart';
import 'package:dev_zone/core/service/api/dio_helper.dart';
import 'package:dev_zone/core/service/service_locator.dart';
import 'package:dev_zone/core/theme/app_theme.dart';
import 'package:dev_zone/features/home/data/repos/home_repo_implementation.dart';
import 'package:dev_zone/features/home/presentation/manager/bloc_observer.dart';
import 'package:dev_zone/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:dev_zone/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:dev_zone/features/home/presentation/views/books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.dioInit();
  serviceLocatorSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                ..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImplementation>())
                ..getNewestBooks(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.kAppName,
        theme: appTheme,
        home: const BooksView(),
      ),
    );
  }
}
