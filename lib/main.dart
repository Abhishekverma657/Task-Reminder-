import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todoprovider.dart';
 
 import 'package:timezone/data/latest.dart' as tz;
import 'package:todo/screens/splashscreen.dart';
 

void main() async{
  // WidgetsFlutterBinding.ensureInitialized(); // Ensure WidgetsBinding is initialized
  tz.initializeTimeZones(); // Initialize time zones
// tz.setLocalLocation(tz.getLocation('Asia/Kolkata')); 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
       ChangeNotifierProvider(
        create: (context) => TodoProvider())

    ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
         
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
       home: SplashScreen(),
      //  home: ChangeNotifierProvider(
      //   create: (context) => TodoProvider(),
      //   child: SplashScreen(),
      ),
      // home:TodoHomeScreen()
     
    );
    
    
  }
}
 