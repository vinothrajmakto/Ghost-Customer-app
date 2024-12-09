import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryRecord extends FirestoreRecord {
  DeliveryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "address1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  // "address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "dfirst_name" field.
  String? _dfirstName;
  String get dfirstName => _dfirstName ?? '';
  bool hasDfirstName() => _dfirstName != null;

  // "dlast_name" field.
  String? _dlastName;
  String get dlastName => _dlastName ?? '';
  bool hasDlastName() => _dlastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "id_proof" field.
  String? _idProof;
  String get idProof => _idProof ?? '';
  bool hasIdProof() => _idProof != null;

  // "type_of_vehicle" field.
  String? _typeOfVehicle;
  String get typeOfVehicle => _typeOfVehicle ?? '';
  bool hasTypeOfVehicle() => _typeOfVehicle != null;

  void _initializeFields() {
    _address1 = snapshotData['address1'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _city = snapshotData['city'] as String?;
    _dfirstName = snapshotData['dfirst_name'] as String?;
    _dlastName = snapshotData['dlast_name'] as String?;
    _email = snapshotData['email'] as String?;
    _idProof = snapshotData['id_proof'] as String?;
    _typeOfVehicle = snapshotData['type_of_vehicle'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('delivery');

  static Stream<DeliveryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliveryRecord.fromSnapshot(s));

  static Future<DeliveryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeliveryRecord.fromSnapshot(s));

  static DeliveryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliveryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliveryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliveryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliveryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliveryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliveryRecordData({
  String? address1,
  String? address2,
  String? city,
  String? dfirstName,
  String? dlastName,
  String? email,
  String? idProof,
  String? typeOfVehicle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address1': address1,
      'address2': address2,
      'city': city,
      'dfirst_name': dfirstName,
      'dlast_name': dlastName,
      'email': email,
      'id_proof': idProof,
      'type_of_vehicle': typeOfVehicle,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeliveryRecordDocumentEquality implements Equality<DeliveryRecord> {
  const DeliveryRecordDocumentEquality();

  @override
  bool equals(DeliveryRecord? e1, DeliveryRecord? e2) {
    return e1?.address1 == e2?.address1 &&
        e1?.address2 == e2?.address2 &&
        e1?.city == e2?.city &&
        e1?.dfirstName == e2?.dfirstName &&
        e1?.dlastName == e2?.dlastName &&
        e1?.email == e2?.email &&
        e1?.idProof == e2?.idProof &&
        e1?.typeOfVehicle == e2?.typeOfVehicle;
  }

  @override
  int hash(DeliveryRecord? e) => const ListEquality().hash([
        e?.address1,
        e?.address2,
        e?.city,
        e?.dfirstName,
        e?.dlastName,
        e?.email,
        e?.idProof,
        e?.typeOfVehicle
      ]);

  @override
  bool isValidKey(Object? o) => o is DeliveryRecord;
}
