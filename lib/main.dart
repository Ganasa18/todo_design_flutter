import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo_test/screens/export_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import 'blocs/exports_bloc.dart';
import 'router/app_router.dart';
import 'service/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(appRouter: AppRouter()),
    ),
    storage: storage,
  );
  // runApp(MyApp(
  //   appRouter: AppRouter(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DarkModeCubit()),
        BlocProvider(
          create: (context) => CurrentDateCubit()
            ..setDateNow(DateTime.now())
            ..setMonthList(DateTime.now())
            ..setScrollTodate(DateTime.now()),
        ),
      ],
      child: BlocBuilder<DarkModeCubit, bool>(
        builder: (context, state) {
          // print(state);
          // inspect(state.themeData);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state
                ? appThemeData[AppTheme.darkTheme]
                : appThemeData[AppTheme.lightTheme],
            initialRoute: 'landing-screen',
            home: const LandingScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
