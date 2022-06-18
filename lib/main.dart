import 'package:flutter/material.dart';
import 'package:movie/app_router.dart';

void main() {
  final AppRouter appRouter = AppRouter();
  runApp(MyApp(
    appRouter: appRouter,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
