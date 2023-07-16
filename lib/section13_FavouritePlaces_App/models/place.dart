import 'package:uuid/uuid.dart';

const uniqueUuid = Uuid();

class PlaceBluePrint {
  PlaceBluePrint({required this.title}): id=uniqueUuid.v4();
  final String id;
  final String title;
}
