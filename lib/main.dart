import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'audio_helpers/page_manager.dart';
import 'audio_helpers/service_locator.dart';
import 'common/color_extention.dart';
import 'widgets/HomePage.dart';



/*
void main() async {
   runApp(MyApp());
}
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp( MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt<PageManager>().init();
  }

  @override
  void dispose() {
    super.dispose();
    getIt<PageManager>().dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Music player",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Circularc Std",
        scaffoldBackgroundColor: TColor.bg,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: TColor.primaryText,
          displayColor: TColor.primaryText,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.red, // Force la couleur ici si besoin
        ),
      ),
      home: const HomePage(),
      // routes: {
      //   "/" : (context) => const HomePage()
      // },
    );
  }
}