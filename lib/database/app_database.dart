import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<Database> createDatabase() async {
  return openDatabase(
    join(
      await getDatabasesPath(),
      'bytebank.db',
    ),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    /* onDowngrade: onDatabaseDowngradeDelete, */
  );
}

Future<int> save(Contact contact) async {
  final Database db = await createDatabase();
  final Map<String, dynamic> contactMap = {};
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;

  return db.insert('contacts', contactMap);

  /* return await createDatabase().then((db) {
    final Map<String, dynamic> contactMap = {};
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;

    return db.insert('contacts', contactMap); 
  })*/
}

Future<List<Contact>> findAll() async {
  final Database db = await createDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> contacts = [];
  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      row['id'],
      row['name'],
      row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;

  /* return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    },
    );
  },
  ); */
}
