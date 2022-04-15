import 'package:cloud_firestore/cloud_firestore.dart';

class StrayCat{
  final String _name;
  final String _breed;
  final int _id;
  final bool _isInjured;
  final GeoPoint _lastSeen;
  final String _profileImgURL;
  StrayCat(
    this._name,
    this._breed,
    this._id,
    this._isInjured,
    this._lastSeen,
    this._profileImgURL,
  );
  String get name{
    return _name;
  }
  String get breed{
    return _breed;
  }
  int get id{
    return _id;
  }
  bool get isInjured{
    return _isInjured;
  }
  GeoPoint get lastSeen{
    return _lastSeen;
  }
  String get profileImgURL{
    return _profileImgURL;
  }
}