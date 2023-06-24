import 'package:flutter/material.dart';
import 'package:movie_app_with_bloc/core/services/services_locator.dart';
import 'package:movie_app_with_bloc/core/utils/app_strings.dart';
import 'package:movie_app_with_bloc/features/movies/presentation/screens/movies_screen.dart';

void main()  {
  runApp(const MyApp());
  ServicesLocator().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        useMaterial3: true,
      ),
      home: const MoviesScreen(),
    );
  }
}
