import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/home.dart';
import 'package:notesapp/model/note.dart';
import 'package:notesapp/model/person.dart';

void main() async {
  // initializing Hive Storage
  await Hive.initFlutter();
  // Register NoteAdapter Auto Generated
  Hive.registerAdapter(NoteAdapter());
  // Person Adapter
  Hive.registerAdapter(PersonAdapter());

  // open hive box, i.e. a db object
  // var nbox = await Hive.openBox<Note>('notesbox');

  personsBox = await Hive.openBox<Person>('personbox');

  personsBox.put(
          "key_init",
          Person(
              name: "Initalizing", age: 100));
  personsBox.put(
          "key_init2",
          Person(
              name: "Simon Peters", age: 24));

  // running app afterwards
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
