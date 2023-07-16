import 'dart:io';

import 'package:uuid/uuid.dart';

const uniqueUuid = Uuid();

class PlaceBluePrint {
  PlaceBluePrint({required this.title, required this.image}) : id = uniqueUuid.v4();
  final String id;
  final String title;
  final File image;
}
