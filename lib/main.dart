import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
              Tab(text: "Tab 4"),
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
            const Text("Hi there"),
            const Image(
                image: NetworkImage(
                    "https://pbs.twimg.com/media/FJxt5B9VUAALRka.jpg")),

            // tab 3
            Column(children: const <Widget>[
              ElevatedButton(
                onPressed: null,
                child: Text('Hi there'),
              ),
              FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
              TextButton(onPressed: null, child: Text("Text")),
              IconButton(onPressed: null, icon: Icon(Icons.person)),
              // DropdownButton(items: items, onChanged: onChanged),
              // PopupMenuButton(itemBuilder: itemBuilder),
            ]),

            // tab 4
            Column(children: const <Widget>[
              // Checkbox(
              //   checkColor: Colors.white,
              //   value: isChecked,
              //   onChanged: (bool? value) {
              //     setState(() {
              //       isChecked = value!;
              //     }
              //     )
              //   }
              // )

              // Radio
            ]),
          ],
        ),
      ),
    );
  }
}
