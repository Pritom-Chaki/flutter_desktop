import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/screen/home_page.dart';
import 'package:flutter_desktop/screen/navigate_page.dart';
import 'package:flutter_desktop/screen/typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/type': (context) => const TypographyPage(),
        '/nav': (context) =>
            CarsPageNavigator(navigatorKey: GlobalKey<NavigatorState>()),
      },
      initialRoute: '/',
    );
  }
}
