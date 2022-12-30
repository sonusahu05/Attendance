import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;
import 'package:path/path.dart' show join;

@immutable
class DatabaseUser {
  final int id;
  final String email;

  const DatabaseUser({
    required this.id,
    required this.email,
  });

  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String;

  @override
  String toString() => 'Person, ID = $id, email = $email';

  @override
  bool operator ==(covariant DatabaseUser other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class DatabaseConcession {
  final int id;
  final int userId;
  final String name;
  final String gender;
  final String email;
  final String nearestStation;
  final String address;
  final DateTime dob;
  final String destinationStation;
  final String trainClass;
  final String period;
  final DateTime dateOfApplication;
  final bool receivedStatus;
  final bool completedStatus;

  DatabaseConcession({
    required this.id,
    required this.userId,
    required this.name,
    required this.gender,
    required this.email,
    required this.nearestStation,
    required this.address,
    required this.dob,
    required this.destinationStation,
    required this.trainClass,
    required this.period,
    required this.dateOfApplication,
    required this.completedStatus,
    required this.receivedStatus,
  });

  DatabaseConcession.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String,
        userId = map[userIdColumn] as int,
        name = map[idColumn] as String,
        gender = map[genderColumn] as String,
        nearestStation = map[nearestStationColumn] as String,
        address = map[addressColumn] as String,
        dob = DateTime.parse(map[dobColumn] as String),
        destinationStation = map[destinationStationColumn] as String,
        trainClass = map[trainClassColumn] as String,
        period = map[periodColumn] as String,
        dateOfApplication =
            DateTime.parse(map[dateOfApplicationColumn] as String),
        receivedStatus = (map[receivedStatusColumn] as int) == 1 ? true : false,
        completedStatus =
            (map[completedStatusColumn] as int) == 1 ? true : false;

  @override
  String toString() =>
      'Concession, ID = $id, email = $email, name = $name, gender = $gender, nearest Station = $nearestStation, address= $address, dob = $dob, class = $trainClass, period = $period, Application Date = $dateOfApplication, received = $receivedStatusColumn, completed = $completedStatusColumn';

  @override
  bool operator ==(covariant DatabaseConcession other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const dbName = 'concession.db';
const concessionTable = 'concession';
const userTable = 'user';
const idColumn = 'id';
const emailColumn = 'email';
const userIdColumn = 'user_id';
const nameColumn = 'name';
const genderColumn = 'gender';
const nearestStationColumn = 'nearest_station';
const addressColumn = 'address';
const dobColumn = 'dob';
const destinationStationColumn = 'destination_station';
const trainClassColumn = 'class';
const periodColumn = 'period';
const dateOfApplicationColumn = 'date';
const receivedStatusColumn = 'received';
const completedStatusColumn = 'completed';

// const String formDetails = 'Concession, ID = $id, email = $email, name = $name, gender = $gender, nearest Station = $nearestStation, address= $address, dob = $dob, class = $trainClass, period = $period, Application Date = $dateOfApplication';
//
