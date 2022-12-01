import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/trackinfo.dart';

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
  final String mainProfilePicture =
      "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg";

  //This function will return the /views/ json when triggered, right now it is called when we press the search button
  Future<http.Response> packageButton(String id) async {
    /*http.Response returnedResult = await http.get(
        Uri.parse(
            'http://ec2-3-17-159-227.us-east-2.compute.amazonaws.com:8080/views/'),
        headers: <String, String>{
          'Content-Type': 'applications/json; charset-UTF-8'
        });
    
    //print(returnedResult.body);*/
    print("Tracking $id has been passed in this function");
    http.Response test_Result = await http.post(
      Uri.parse('http://blueeggstracker.com:8080/'),
      headers: <String, String>{
        'Content-Type': 'applications/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'title': 'SHIPPO_TRANSIT',
        'title2': id,
      }),
    );

    // Map<String, dynamic> myMap = json.decode(test_Result.body); //
    //print(myMap['tracking_history']);

    //functionToPrint(myMap)  -> It will switch to a different pages showing the track information

    //print(test_string);

    return test_Result;
  }

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    String trackingID = '';
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
                                onChanged: (text) {
                                  trackingID =
                                      text; //We're updating trackingID real time in every input text is entered
                                }, //There can be an optimized way to update trackingID instead of updating it concurrently
                                /* textInputAction: TextInputAction.search, 
                                onSubmitted: (value){
                                  print(value);
                                },*/
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
                              onPressed: () async {
                                var data =
                                    (await packageButton(trackingID)).body;
                                Map<String, dynamic> myMap = json.decode(data);

                                // print(myMap['tracking_history']);
                                //const String str = myMap['tracking_history'];
                                String str =
                                    myMap['tracking_history'].toString();
                                // Create multiple string variable needed for tracking information

                                TrackInfo thisINFO =
                                    new TrackInfo.fromJson(myMap);
                                print('passed here');

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return TrackInformation(
                                      title: 'TrackInformation',
                                      trackhistory: str,
                                      trackinfo: thisINFO);
                                }));

                                /// function(myMap){
                                ///  Navigate push() blah balh
                                /// }
                                ///
                              },
                              icon: Icon(Icons.search),
                              //style: ButtonStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    /*Container(child: Text("Images from:")),
                    Text("Adobe Stock: Profile Image\n"
                        "pexels.com: Package Handoff\n"
                        "iStock: Truck driving down road\n"
                        "Images should be liscensed or removed"),
                        House image from https://clipartix.com/home-clip-art-image-32741/
                        Moving man image from https://www.clipartmax.com/so/moving-boxes-clipart/ */
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class TrackInformation extends StatelessWidget {
  TrackInformation(
      {Key? key,
      required this.title,
      required this.trackhistory,
      required this.trackinfo})
      : super(key: key);
  String title;
  String trackhistory;
  TrackInfo trackinfo;

  ///
  @override
  Widget build(BuildContext context) {
    String state = trackinfo.tracking_status?.location?.state ?? 'null';
    String city = trackinfo.tracking_status?.location?.city ?? 'null';
    String location = city + ", " + state;

    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Home(title: 'Home');
              }));
            },
            child: Text(
              "Your package",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.purple[700],
        ),
        body: DefaultTextStyle(
          style: TextStyle(),
          child: Row(children: [
            SizedBox(
              width: 170,
              child: Column(//Second column, has the labels for the data
                  children: [
                SizedBox(
                  width: 200,
                  height: 100,
                ),
                Text(
                  "Tracking number: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Carrier: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Shipping category: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            SizedBox(
              width: 200,
              child: Column(//Third Column, holds data from the json
                  children: [
                SizedBox(
                  width: 200,
                  height: 100,
                ),
                Text(trackinfo.tracking_number ?? 'null'),
                Text(trackinfo.carrier ?? 'null'),
                Text(trackinfo.servicelevel.name ?? 'null'),
              ]),
            ),
            SizedBox(
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                child: Column(children: [
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: Image(
                      image: AssetImage("assets/images/manMovingBox.png"),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Current eta: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: new Text(
                        "Package status: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Location: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Status updated on: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30,
                ),
                child: Column(children: [
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: Image(
                      image: AssetImage("assets/images/homeClipart.jpg"),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                          width: 500,
                          child: Text((trackinfo.eta ?? 'Delivered!').substring(0,10))
                      )
                  ),
                  Expanded(
                    child: SizedBox(
                        width: 500,
                        child: new Text(trackinfo.tracking_status?.status_details ?? 'null')
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                          width: 500,
                          child: Text(location)
                      ),
                  ),
                  Expanded(
                      child: SizedBox(
                          width: 500,
                          child: Text((trackinfo.tracking_status?.status_date ?? 'Delivered!').substring(0,10))
                      )
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
