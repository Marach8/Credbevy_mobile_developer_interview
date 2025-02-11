import 'dart:ui';
import 'package:credbevy_task/src/global_export.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: CredBevApp()));
}


class CredBevApp extends StatelessWidget {
  const CredBevApp({super.key});

  @override
  Widget build(context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(0.83),
      ),
      child: MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: CredBevThemeData.lightTheme,
        theme: CredBevThemeData.lightTheme,
        routes: credBevRoutes
      ),
    );
  }
}