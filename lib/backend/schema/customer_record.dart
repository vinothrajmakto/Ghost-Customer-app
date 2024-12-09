import 'dart:async';
import 'package:collection/collection.dart';
import '/backend/schema/util/firestore_util.dart';
import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerRecord extends FirestoreRecord {
  CustomerRecord._(super.reference, super.data) {
    _initializeFields();
  }

  // Fields with enhanced null-safety checks
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  String? _addresstype;
  String get addresstype => _addresstype ?? '';
  bool hasAddresstype() => _addresstype != null;

  int? _wallet;
  int get wallet => _wallet ?? 0;
  bool hasWallet() => _wallet != null;

  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  String? _password; // Consider encrypting sensitive data
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;



  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // Initialize fields with enhanced error handling
  void _initializeFields() {
    _customerName = snapshotData['customer_name'] as String?;
    _address1 = snapshotData['address1'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _city = snapshotData['city'] as String?;
    _dob = (snapshotData['dob'] is Timestamp)
        ? (snapshotData['dob'] as Timestamp).toDate()
        : null;
    _gender = snapshotData['gender'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _email = snapshotData['email'] as String?;
    _country = snapshotData['country'] as String?;
    _addresstype = snapshotData['addresstype'] as String?;
    _wallet = castToType<int>(snapshotData['wallet']);
    _photo = snapshotData['photo'] as String?;
    _password = snapshotData['password'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = (snapshotData['created_time'] is Timestamp)
        ? (snapshotData['created_time'] as Timestamp).toDate()
        : null;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer');

  static Stream<CustomerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerRecord.fromSnapshot(s));

  static Future<CustomerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerRecord.fromSnapshot(s));

  static CustomerRecord fromSnapshot(DocumentSnapshot snapshot) => CustomerRecord._(
    snapshot.reference,
    mapFromFirestore(snapshot.data() as Map<String, dynamic>),
  );

  static CustomerRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      CustomerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() => 'CustomerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is CustomerRecord && reference.path == other.reference.path);
}

Map<String, dynamic> createCustomerRecordData({
  String? customerName,
  String? address1,
  String? address2,
  String? city,
  DateTime? dob,
  String? gender,
  String? firstName,
  String? lastName,
  String? uid,
  String? email,
  String? country,
  String? addresstype,
  int? wallet,
  String? photo,
  String? password,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  return mapToFirestore(<String, dynamic>{
    'customer_name': customerName,
    'address1': address1,
    'address2': address2,
    'city': city,
    'dob': dob,
    'gender': gender,
    'first_name': firstName,
    'last_name': lastName,
    'uid': uid,
    'email': email,
    'country': country,
    'addresstype': addresstype,
    'wallet': wallet,
    'photo': photo,
    'password': password,
    'display_name': displayName,
    'photo_url': photoUrl,
    'created_time': createdTime,
    'phone_number': phoneNumber,
  }.withoutNulls);
}

class CustomerRecordDocumentEquality implements Equality<CustomerRecord> {
  const CustomerRecordDocumentEquality();

  @override
  bool equals(CustomerRecord? e1, CustomerRecord? e2) {
    return e1?.customerName == e2?.customerName &&
        e1?.address1 == e2?.address1 &&
        e1?.address2 == e2?.address2 &&
        e1?.city == e2?.city &&
        e1?.dob == e2?.dob &&
        e1?.gender == e2?.gender &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.uid == e2?.uid &&
        e1?.email == e2?.email &&
        e1?.country == e2?.country &&
        e1?.addresstype == e2?.addresstype &&
        e1?.wallet == e2?.wallet &&
        e1?.photo == e2?.photo &&
        e1?.password == e2?.password &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(CustomerRecord? e) => const ListEquality().hash([
    e?.customerName,
    e?.address1,
    e?.address2,
    e?.city,
    e?.dob,
    e?.gender,
    e?.firstName,
    e?.lastName,
    e?.uid,
    e?.email,
    e?.country,
    e?.addresstype,
    e?.wallet,
    e?.photo,
    e?.password,
    e?.displayName,
    e?.photoUrl,
    e?.createdTime,
    e?.phoneNumber,
  ]);

  @override
  bool isValidKey(Object? o) => o is CustomerRecord;
}
