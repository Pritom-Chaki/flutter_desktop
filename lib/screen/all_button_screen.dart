import 'package:fluent_ui/fluent_ui.dart';

class AllButtonPage extends StatefulWidget {
  const AllButtonPage({Key? key}) : super(key: key);

  @override
  _AllButtonPageState createState() => _AllButtonPageState();
}

class _AllButtonPageState extends State<AllButtonPage> {
  static const double splitButtonHeight = 25.0;
  bool _value = false;
  bool _checked = true;
  int _currentIndex = -1;
  double _sliderValue = 0;
  double rating = 0.0;
  final List<String> radioButtons = <String>[
    'RadioButton 1',
    'RadioButton 2',
    'RadioButton 3',
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: const Text("Button Screen"),
        leading: const Icon(FluentIcons.button_control),
        backgroundColor: Colors.magenta,
      ),
      content: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Button(
                child: const Text('Standard XAML button'),
                // Set onPressed to null to disable the button
                onPressed: () {
                  print('button pressed');
                }),
            FilledButton(
              child: Text('FILLED BUTTON'),
              onPressed: () {
                print('pressed filled button');
              },
            ),
            IconButton(
              icon: Icon(FluentIcons.add),
              onPressed: () {
                print('pressed icon button');
              },
            ),
            OutlinedButton(
              child: Text('OUTLINED BUTTON'),
              onPressed: () {
                print('pressed outlined button');
              },
            ),
            TextButton(
              child: Text('TEXT BUTTON'),
              onPressed: () {
                print('pressed text button');
              },
            ),
            SplitButtonBar(
              style: const SplitButtonThemeData(
                interval: 1, // the default value is one
              ),
              // There need to be at least 2 items in the buttons, and they must be non-null
              buttons: [
                SizedBox(
                  height: splitButtonHeight,
                  child: Button(
                    child: Container(
                      height: 30,
                      width: 30,
                      color: FluentTheme.of(context).accentColor,
                    ),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: const SizedBox(
                    height: splitButtonHeight,
                    child: Icon(FluentIcons.chevron_down, size: 10.0),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            ToggleButton(
              child: Text('Toggle Button'),
              checked: _value,
              onChanged: (value) => setState(() => _value = value),
            ),
          
              ],
            ),

             Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Checkbox(
              checked: _checked,
              onChanged: (value) => setState(() => _checked = value!),
            ),
            ToggleSwitch(
                checked: _checked,
                onChanged: (v) => setState(() => _checked = v),
                content: Text(_checked ? 'On' : 'Off')),
            Column(
              children: List.generate(radioButtons.length, (index) {
                return RadioButton(
                  checked: _currentIndex == index,
                  // set onChanged to null to disable the button
                  onChanged: (value) => setState(() => _currentIndex = index),
                  content: Text(radioButtons[index]),
                );
              }),
            ),
            DropDownButton(
              leading: const Icon(FluentIcons.align_left),
              title: const Text('Alignment'),
              items: [
                DropDownButtonItem(
                  title: const Text('Left'),
                  leading: const Icon(FluentIcons.align_left),
                  onTap: () => debugPrint('left'),
                ),
                DropDownButtonItem(
                  title: const Text('Center'),
                  leading: const Icon(FluentIcons.align_center),
                  onTap: () => debugPrint('center'),
                ),
                DropDownButtonItem(
                  title: const Text('Right'),
                  leading: const Icon(FluentIcons.align_right),
                  onTap: () => debugPrint('right'),
                ),
              ],
            ),
            SizedBox(
              // The default width is 200.
              // The slider does not have its own widget, so you have to add it yourself.
              // The slider always try to be as big as possible
              width: 200,
              child: Slider(
                max: 100,
                value: _sliderValue,
                onChanged: (v) => setState(() => _sliderValue = v),
                // Label is the text displayed above the slider when the user is interacting with it.
                label: '${_sliderValue.toInt()}',
              ),
            ),
            RatingBar(
              rating: rating,
              onChanged: (v) => setState(() => rating = v),
            )
         
              ],
            ),
          
          
          

          ],
        ),
      ),
    );
  }
}
