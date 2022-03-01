import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_desktop/screen/icons_screen.dart';
import 'package:flutter_desktop/screen/others_screen.dart';
import 'package:flutter_desktop/screen/form_screen.dart';
import 'package:flutter_desktop/screen/inputs_screen.dart';
import 'package:flutter_desktop/screen/mobile_screen.dart';
import 'package:flutter_desktop/screen/typography.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            title: const Text("Mobile"),
            infoBadge: const InfoBadge(
              source: Text("2"),
            ),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.account_management),
            title: const Text("Inputs"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.ctrl_button),
            title: const Text("Others"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.ctrl_button),
            title: const Text("Form"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.ctrl_button),
            title: const Text("Typography"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.ctrl_button),
            title: const Text("Icons"),
          ),
        ],
        footerItems: [
          PaneItemHeader(
            header: const Text("This is Header of Footer Item"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.machine_learning),
            infoBadge: const InfoBadge(
              source: Text("This is InfoBadge"),
            ),
          ),
          PaneItemSeparator(color: Colors.red),
          PaneItem(
            icon: const Icon(FluentIcons.account_management),
          ),
          PaneItemSeparator(color: Colors.blue),
          PaneItem(
            icon: const Icon(FluentIcons.airplane),
          ),
        ],
      ),
      //content body
      content: NavigationBody(
        index: _selectIndex,
        children: const [
          MobilePage(),
          //call ScaffoldPage
          InputsPage(),
          //call a page
          OthersPage(),
          FormPage(),
          TypographyPage(),
          IconsPage(),
          ScaffoldPage(
            content: Center(child: Text("Page Last")),
            header: Text('ScaffoldPage Header'),
            bottomBar: Text('ScaffoldPage bottomBar'),
            padding: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
