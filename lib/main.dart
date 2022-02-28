import 'package:fluent_ui/fluent_ui.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectIndex = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
          title: Text(widget.title),
          leading: const Icon(FluentIcons.alarm_clock),
          backgroundColor: Colors.blue,
          actions: Row(
            children: const [
              Icon(FluentIcons.admin_a_logo_inverse32),
              Icon(FluentIcons.document_management),
              Icon(FluentIcons.guitar),
            ],
          )),
      pane: NavigationPane(
        selected: _selectIndex,
        onChanged: (newIndex) {
          setState(() {
            _selectIndex = newIndex;
          });
        },
        header: const Text("This is Header of Pane"),
        menuButton: const Icon(FluentIcons.review_solid),
        autoSuggestBox: const Text("This is Auto Suggest of Pane"),
        autoSuggestBoxReplacement:
            const Text("This is Auto Suggest Replacement of Pane"),
        size: const NavigationPaneSize(
            openMaxWidth: 200, openMinWidth: 100, topHeight: 100),
        displayMode: PaneDisplayMode.auto,
        items: [
          PaneItemHeader(header: const Text("This is Header of Item")),
          PaneItem(
            icon: const Icon(FluentIcons.machine_learning),
            title: const Text("Page 0"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.account_management),
            title: const Text("Page 1"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.airplane),
            title: const Text("Page 2"),
          ),
        ],
        footerItems: [
          PaneItemHeader(
            header: const Text("This is Header of Footer Item"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.machine_learning),
            //  title: const Text("Page 0"),
          ),
          PaneItemSeparator(color: Colors.red),
          PaneItem(
            icon: const Icon(FluentIcons.account_management),
            //  title: const Text("Page 1"),
          ),
          PaneItemSeparator(color: Colors.blue),
          PaneItem(
            icon: const Icon(FluentIcons.airplane),
            // title: const Text("Page 2"),
          ),
        ],
      ),

      //content body
      content: NavigationBody(
        index: _selectIndex,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                ),
                Button(
                  onPressed: _incrementCounter,
                  child: const Icon(FluentIcons.add),
                ),
              ],
            ),
          ),
          const ScaffoldPage(
            content: Center(child: Text("Page 1")),
          ),
          const ScaffoldPage(
            content: Center(child: Text("Page 2")),
          ),
          const ScaffoldPage(
            content: Center(child: Text("Page 3")),
          ),
          const ScaffoldPage(
            content: Center(child: Text("Page 4")),
          ),
          const ScaffoldPage(
            content: Center(child: Text("Page 5")),
          ),
        ],
      ),
    );
  }
}
