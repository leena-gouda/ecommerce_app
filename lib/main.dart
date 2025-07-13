import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/utils/notification_service.dart';

bool isLogin = false;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('📩 background notification:  ${message.notification?.title}');
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await isLoggedIn();

  await NotificationService.init();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        useMaterial3: true,
        fontFamily: "Montserrat",
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      initialRoute: isLogin == true ? Routes.homeScreen : Routes.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

isLoggedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString("email");
  if (email != null && email.isNotEmpty) {
    isLogin = true;
  } else {
    isLogin = false;
  }
}