import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mundial_cromos/logic/app_bloc.dart';

import 'package:mundial_cromos/routs.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('internalData');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return BlocProvider(
      create: (context) => AppBloc()..add(OnLoadData()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Album Mundial 2022',
        initialRoute: AppRoutes.homePage,
        onGenerateRoute: AppRoutes.generateRoute,
        theme: ThemeData.light().copyWith(
            // primaryColor: const Color(0xff7F1431),
            appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff7F1431),
        )),
      ),
    );
  }
}
