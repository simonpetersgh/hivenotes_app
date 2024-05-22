import 'package:hive/hive.dart';

part 'note.g.dart';
// Model Class adapter to be generated to this file

// Notes class to auto generate adapter
@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String content;

  @HiveField(2)
  late DateTime dateCreated;

  @HiveField(3)
  late DateTime lastEdited;
}

// // Note Class for Hive Adapater
// class Note2 {
//   late String title;
//   late String content;
//   late DateTime dateCreated;
//   late DateTime lastEdited;
//   // Note Constructor
//   Note2(this.title, this.content, this.dateCreated, this.lastEdited);
// }

