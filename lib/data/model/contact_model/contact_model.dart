import 'package:hive/hive.dart';

part 'contact_model.g.dart'; //Kết nối với 'contact_model.g.dart

@HiveType(typeId: 0) //Khai báo HiveType
class Contact {
  @HiveField(0) //Khai báo HiveField
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String phone;

  Contact(this.name, this.email, this.phone);
}
