import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.g.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  //final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ValueNotifier<ThemeMode>>();

    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.aboreto(
            fontSize: 22,
            color: lightColorScheme.onBackground,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.montserrat(
            fontSize: 22,
            color: darkColorScheme.onBackground,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(),
      ),
      highContrastTheme: ThemeData(
        useMaterial3: true,
        colorScheme: hightColorScheme,
        textTheme: GoogleFonts.jetBrainsMonoTextTheme(),
      ),
      highContrastDarkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: hightColorScheme,
        textTheme: GoogleFonts.jetBrainsMonoTextTheme(),
      ),
      themeMode: themeMode.value,
     // routerConfig: _appRouter.config(),
    );
  }
}
