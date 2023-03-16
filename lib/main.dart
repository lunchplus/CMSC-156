import 'package:flutter/material.dart';

enum SampleItem { popupOne, popupTwo, popupThree }

enum FavoriteGame { hades, dst, ror }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SampleItem? selectedMenu;
  String dropdownvalue = 'Tabby';
  FavoriteGame _game = FavoriteGame.hades;

  bool isChecked = false;
  bool turnedOn = true;
  double _currentSliderValue = 99;

  // List of items in our dropdown menu
  var items = [
    'Tabby',
    'Persian',
    'Chonk',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Totally Not Random App"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.abc)),
              Tab(icon: Icon(Icons.photo_camera)),
              Tab(icon: Icon(Icons.mouse)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lloyd DC"),
              accountEmail: Text("lmdelacruz4@up.edu.ph"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
            ),
          ],
        )),
        body: TabBarView(
          children: [
            const Center(
                child: Text(
              "I have the best UI.",
              // fontWeight: FontWeight.w700,
              // fontStyle: FontStyle.italic,
              textAlign: TextAlign.center,
            )),
            const Image(
                image: NetworkImage(
                    "https://pbs.twimg.com/media/FJxt5B9VUAALRka.jpg")),

            // tab 3
            Column(
              children: <Widget>[
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Click me!'),
                ),
                const FloatingActionButton(
                    onPressed: null, child: Icon(Icons.add)),
                const TextButton(
                    onPressed: null, child: Text("You can't click me :D")),
                const IconButton(onPressed: null, icon: Icon(Icons.money)),
                DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (SampleItem item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },

                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.popupOne,
                      child: Text('Tom'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.popupTwo,
                      child: Text('Jerry'),
                    ),
                    const PopupMenuItem<SampleItem>(
                      value: SampleItem.popupThree,
                      child: Text('Spike'),
                    ),
                  ],
                ),
              ],
            ),

            // tab 4
            Column(children: <Widget>[
              ListTile(
                title: const Text('I agree 100% this UI is the best.'),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.black,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
              const Text('What is your favorite game?'),
              ListTile(
                title: const Text('Hades'),
                leading: Radio(
                  value: FavoriteGame.hades,
                  groupValue: _game,
                  onChanged: (FavoriteGame? value) {
                    setState(() {
                      _game = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Don\'t Starve Together'),
                leading: Radio(
                  value: FavoriteGame.dst,
                  groupValue: _game,
                  onChanged: (FavoriteGame? value) {
                    setState(() {
                      _game = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Risk of Rain'),
                leading: Radio(
                  value: FavoriteGame.ror,
                  groupValue: _game,
                  onChanged: (FavoriteGame? value) {
                    setState(() {
                      _game = value!;
                    });
                  },
                ),
              ),
              Switch(
                value: turnedOn,
                activeColor: Colors.deepPurple,
                onChanged: (bool value) {
                  setState(() {
                    turnedOn = value;
                  });
                },
              ),
              const Text('How would you rate the interface?'),
              Slider(
                value: _currentSliderValue,
                max: 100,
                min: 99,
                divisions: 1,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
