import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_simplean/home.dart';
import 'package:latihan_simplean/repository/kecamatan_repo.dart';

import 'bloc/kecamatan_bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final KecamatanRepo kecamatanRepo = KecamatanRepo();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KecamatanBloc(kecamatanRepo: kecamatanRepo),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              backgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  brightness: Brightness.light,
                  elevation: 0)),
          title: 'Ngapak News Time',
          home: Home()),
    );
  }
}
