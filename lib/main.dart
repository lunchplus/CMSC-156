import 'package:flutter/material.dart';

enum PopUpItem { popOne, popTwo, popThree }

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
  // default dropdown value
  String dropdownvalue = 'Tabby';

  PopUpItem? selectedMenu;
  FavoriteGame _game = FavoriteGame.hades;

  bool isChecked = false;
  bool turnedOn = true;
  double _currentSliderValue = 99;

  // items for dropdown menu
  var items = [
    'Tabby',
    'Persian',
    'Chonk',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // 4 tabs
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lloyd's First App"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.abc)),
              Tab(icon: Icon(Icons.photo_camera)),
              Tab(icon: Icon(Icons.mouse)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
        ),

        // drawer for user settings
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
            // tab 1
            const Center(
                child: Text(
              "I have the best UI. periodt.",
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            )),

            // tab 2
            const Image(
                image: NetworkImage(
                    "https://pbs.twimg.com/media/FJxt5B9VUAALRka.jpg")),

            // tab 3
            Column(
              children: <Widget>[
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Nothing will happen!'),
                ),
                const SizedBox(height: 30),
                FloatingActionButton(
                    onPressed: () {}, child: const Icon(Icons.add)),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () {},
                    child: const Text("Also nothing will happen")),
                const SizedBox(height: 30),
                IconButton(onPressed: () {}, icon: const Icon(Icons.alarm)),
                const SizedBox(height: 30),
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
                const SizedBox(height: 30),
                PopupMenuButton<PopUpItem>(
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (PopUpItem item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },

                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<PopUpItem>>[
                    const PopupMenuItem<PopUpItem>(
                      value: PopUpItem.popOne,
                      child: Text('Report'),
                    ),
                    const PopupMenuItem<PopUpItem>(
                      value: PopUpItem.popTwo,
                      child: Text('Flag'),
                    ),
                    const PopupMenuItem<PopUpItem>(
                      value: PopUpItem.popThree,
                      child: Text('Exit'),
                    ),
                  ],
                ),
              ],
            ),

            // tab 4
            Column(children: <Widget>[
              const SizedBox(height: 30),
              ListTile(
                title: const Text('I agree 100% this UI is the best.'),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.deepPurple,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 30),
              ListTile(
                leading: const FlutterLogo(),
                title: const Text('Toggle nothing.'),
                trailing: Switch(
                  value: turnedOn,
                  activeColor: Colors.deepPurple,
                  onChanged: (bool value) {
                    setState(() {
                      turnedOn = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
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
