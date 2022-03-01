
import 'package:fluent_ui/fluent_ui.dart';

class CarsPageNavigator extends StatelessWidget {
  const CarsPageNavigator(
      {Key? key, required this.navigatorKey})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: '/car',
        onGenerateRoute: (RouteSettings routeSettings) {
          return FluentPageRoute(
              settings: routeSettings,
              builder: (context) {
                return Container(
                  height: 500,
                  width: 700,
                  color: Colors.magenta,
                  alignment: Alignment.center,
                  child: Text(
                    "Navigate to this page",
                    style: FluentTheme.of(context).typography.titleLarge,
                  ),
                );
              });
        });
  }

}