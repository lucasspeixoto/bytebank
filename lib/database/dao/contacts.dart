/* import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'bytebank.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );

  Future<void> insertContact(Contact contact) async {
    final db = await database;

    await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contact>> contacts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('contacts');

    return List.generate(maps.length, (i) {
      return Contact(
        id: maps[i]['id'],
        name: maps[i]['name'],
        accountNumber: maps[i]['account_number'],
      );
    });
  }

  Future<void> updateContact(Contact contact) async {
    final db = await database;

    await db.update(
      'dogs',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final db = await database;

    await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  var fido = const Contact(
    id: 0,
    name: 'Fido',
    accountNumber: 1535,
  );

  await insertContact(fido);

  final List<Contact> allContacts = await contacts();
  debugPrint('$allContacts');

  fido = Contact(
    id: fido.id,
    name: fido.name,
    accountNumber: fido.accountNumber + 7,
  );
  await updateContact(fido);

  final List<Contact> allContacts1 = await contacts();
  debugPrint('$allContacts1');

  await deleteContact(fido.id);

  final List<Contact> allContacts2 = await contacts();
  debugPrint('$allContacts2');
}

class Contact {
  final int id;
  final String name;
  final int accountNumber;

  const Contact({
    required this.id,
    required this.name,
    required this.accountNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'account_number': accountNumber,
    };
  }

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, age: $accountNumber}';
  }
}
 */