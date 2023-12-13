import 'package:flutter/material.dart';
import 'package:flutter_budget_track/home_page.dart';
import 'package:flutter_budget_track/themes/dark.dart';
import 'package:flutter_budget_track/themes/light.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(786, 1704),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        // tema sisteme göre değişecek
        theme: lightTheme,
        //darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
