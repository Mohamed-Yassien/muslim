import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/data/sources/local/sharedpreferences.dart';
import 'app/presentation/screens/surah_ayat/cubit/surah_ayat_cubit.dart';
import 'app/presentation/screens/surahs/cubit/surahs_cubit.dart';
import 'core/bloc_observer.dart';
import 'core/routes/routes.dart';
import 'core/themes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'EG'),
      startLocale: const Locale('ar', 'EG'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahsCubit()..loadSurahs(),
        ),
        BlocProvider(
          create: (context) => SurahAyatCubit(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: lightTheme,
        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
