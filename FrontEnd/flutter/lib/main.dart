import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Home'),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  final String mainProfilePicture = "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home(title: 'Home');
                }));
              },
              child: Text(
                "Universal Package Tracker",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.purple[700],
          ),
          drawer: Drawer(
              backgroundColor: Colors.purple[700],
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Individual Person"),
                    accountEmail: Text("example@BlueEggs.com"),
                    currentAccountPicture: GestureDetector(
                      onTap: () => print("Account clicked"),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePicture),
                      )
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/truckDrivingDown.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Home"),
                    trailing: Icon(Icons.home),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Home(title: 'Home');
                        }));
                      }
                  ),
                  ListTile(
                    title: Text("View Packages"),
                    trailing: Icon(Icons.backpack),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Packages(title: 'Packages');
                        }));
                      }
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Account"),
                    trailing: Icon(Icons.account_box),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Account(title: 'Account');
                        }));
                      }

                  ),
                ],
              )
          ),
          body: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    /*TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                    ),*/
                    SizedBox(
                      width: 700,
                      height: 400,
                      child: Image(
                          image: AssetImage("assets/images/packageHandoff.jpg"),
                        ),
                      ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 400,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your tracking number',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                              //style: ButtonStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        child: Text("Images from:")
                    ),
                    Text("Adobe Stock: Profile Image\n"
                        "pexels.com: Package Handoff\n"
                        "iStock: Truck driving down road\n"
                        "Images should be liscensed or removed"),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

class Packages extends StatelessWidget {
  const Packages({Key? key, required this.title}) : super(key: key);
  final String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home(title: 'Home');
                }));
              },
              child: Text(
                "Universal Package Tracker",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.purple[700],
          ),
          drawer: Drawer(
              backgroundColor: Colors.purple[700],
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Individual Person"),
                    accountEmail: Text("example@BlueEggs.com"),
                    currentAccountPicture: new GestureDetector(
                        onTap: () => print("Account clicked"),
                        child: new CircleAvatar(
                        )
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/truckDrivingDown.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ListTile(
                      title: Text("Home"),
                      trailing: Icon(Icons.home),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Home(title: 'Home');
                        }));
                      }
                  ),
                  ListTile(
                      title: Text("View Packages"),
                      trailing: Icon(Icons.backpack),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Packages(title: 'Packages');
                        }));
                      }
                  ),
                  Divider(),
                  ListTile(
                      title: Text("Account"),
                      trailing: Icon(Icons.account_box),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Account(title: 'Account');
                        }));
                      }

                  ),
                ],
              )
          ),
          body: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    /*TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                    ),*/
                    Text(
                        'Package Information',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('Tracking Number: '),
                            Text('Destination: '),
                            Text('Being Shipped From: '),
                            Text('Being Shipped By: '),
                            Text('Days in Transit: '),
                            Text('Estimated Delivery: '),
                            Row(
                                children: [
                                  Text('Save Tracking Info'),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.save),
                                  )
                                ]
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

class Account extends StatelessWidget {
  const Account({Key? key, required this.title}) : super(key: key);
  final String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home(title: 'Home');
                }));
              },
              child: Text(
                "Universal Package Tracker",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.purple[700],
          ),
          drawer: Drawer(
              backgroundColor: Colors.purple[700],
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text("Individual Person"),
                    accountEmail: Text("example@BlueEggs.com"),
                    currentAccountPicture: new GestureDetector(
                        onTap: () => print("Account clicked"),
                        child: new CircleAvatar(
                        )
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/truckDrivingDown.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ListTile(
                      title: Text("Home"),
                      trailing: Icon(Icons.home),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Home(title: 'Home');
                        }));
                      }
                  ),
                  ListTile(
                      title: Text("View Packages"),
                      trailing: Icon(Icons.backpack),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Packages(title: 'Packages');
                        }));
                      }
                  ),
                  Divider(),
                  ListTile(
                      title: Text("Account"),
                      trailing: Icon(Icons.account_box),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Account(title: 'Account');
                        }));
                      }

                  ),
                ],
              )
          ),
          body: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    /*TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                    ),*/
                    Text(
                        'Account Information',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Row(
                      children: [
                        Row(
                        children: [
                          Column(
                          children: [
                            Text('Name: '),
                            Text('Email: '),
                            Text('Phone Number: '),
                            Text('Packages Being Tracked'),
                          ],
                        ),
                          Column(
                            children: [
                              Text('Individual Person'),
                              Text('example@BlueEggs.com'),
                              Text('(123)456-7890'),
                              Text(''),
                              //Row(
                                  //children: [
                                    //Text('Save Account Information'),
                                    //IconButton(
                                      //onPressed: () {},
                                      //icon: Icon(Icons.save),
                                    //)
                                  ]
                              ),
                            ]
                          )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          )
      );
  }
}
