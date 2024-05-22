// Home Page
import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/model/person.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TO DO : implement initState
    personsBox;
    super.initState();
  }

  // textfiled controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Person person1 = personsBox.getAt(0);

  // reference hive box
  // final _hiveBox = Hive.box("notesbox");

  // write data
  void addPerson() {
    // _hiveBox.put(1, "Simon");
    setState(() {
      personsBox.put(
          "key_${nameController.text}",
          Person(
              name: nameController.text, age: int.parse(ageController.text)));
      // clear input fields
      nameController.clear();
      ageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HiveNotes"),
      ),
      //
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Output Section
              const Text("Hive CRUD Ops"),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(
                          style: BorderStyle.solid, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      // Input Fields
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              label: const Text("Name"),
                              hintText: "Enter name",
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      // Age Input field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ageController,
                          decoration: InputDecoration(
                              label: const Text("Age"),
                              hintText: "Enter age in number, e.g. 35",
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // write button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: addPerson,
                      color: Colors.blue,
                      child: const Text("Add"),
                    ),
                  ),

                  // read button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: const Text("Read"),
                    ),
                  ),

                  // delete buttom
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: const Text("Delete"),
                    ),
                  ),
                ],
              ),
              // Action row ends
              const Text("HiveBox Data Result"),

              const SizedBox(
                height: 10,
              ),
              // box output
              // Text(personsBox.getAt(0)),
              // debugPrint(personsBox.get());
              Text("${person1.name}, ${person1.age}"),

              // # Working Output section/container with list builder
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // color: Colors.amber,
                  height: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(8)),
                  // persons listview build
                  child: ListView.builder(
                    itemCount: personsBox.length,
                    itemBuilder: (context, index) {
                      // Get persons from box
                      Person person = personsBox.getAt(index);
                      return ListTile(
                        title: Text("${person.name}, ${person.age.toString()}"),
                        subtitle: Text("Person at index $index"),
                        trailing: const Icon(Icons.more_vert_rounded),
                        // tileColor: Colors.black,
                        horizontalTitleGap: 4,
                        hoverColor: Colors.blue,
                        style: ListTileStyle.drawer,
                      );
                    },
                  ),
                ),
              ),
              // out put container ends

              // other actions

              // Delete all row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      // style: const ButtonStyle(
                      //   backgroundColor: MaterialStatePropertyAll(Colors.red),
                      // ),
                      onPressed: () {
                        setState(() {
                          personsBox.clear();
                        });
                      },
                      child: const Text(
                        "Delete All",
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              )

              // Output section/container: yellow background
              // Expanded(
              //   flex: 1,
              //   child: SizedBox(
              //     height: 200,
              //     child: ListView(
              //       scrollDirection: Axis.vertical,
              //       children: [
              //         ListTile(
              //           title: Text(
              //               "${person.name}, ${person.age.toString()}"),
              //           subtitle: Text(
              //               "Person at index ${personsBox.getAt(0)}"),
              //         ),
              //       ],
              //     ),
              //   ),
              // ), // Output section/container ends
            ]),
      ),
    );
  }
}


// ListView(
//                     scrollDirection: Axis.vertical,
//                     children: const [ 
//                       Text("heloooooooooooooooo"),
//                       Text("helooooooooooooooooooo0000000000"),
//                     ],
//                   ),

// persons listview build
                          // ListView.builder(
                          //   itemCount: personsBox.length,
                          //   itemBuilder: (context, index) {
                          //     // Get persons from box
                          //     Person person = personsBox.getAt(index);

                          //     return ListTile(
                          //       title: Text(
                          //           "${person.name}, ${person.age.toString()}"),
                          //       subtitle: Text("Person at index $index"),
                          //     );
                          //   },
                          // ),
                          // builder ends