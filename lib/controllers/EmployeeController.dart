import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Employee');

class EmployeeController {
  static Future<Response> store({
    required String firstName,
    required String lastName,
    required String position,
    required String dateOfBirth,
    required String avatarURL,
    required String email,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "firstName": firstName,
      "position": position,
      "lastName": lastName,
      "dateOfBirth": dateOfBirth,
      "avatarURL": avatarURL,
      "email": email,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> read() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> update({
    required String firstName,
    required String lastName,
    required String position,
    required String dateOfBirth,
    required String avatarURL,
    required String email,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "firstName": firstName,
      "position": position,
      "lastName": lastName,
      "dateOfBirth": dateOfBirth,
      "avatarURL": avatarURL,
      "email": email,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated employee info";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> delete({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
