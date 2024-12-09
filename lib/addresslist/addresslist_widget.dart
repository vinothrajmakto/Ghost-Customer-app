import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../myaddress/myaddress_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'addresslist_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Add this import

class AddresslistWidget extends StatefulWidget {
  const AddresslistWidget({super.key});

  @override
  State<AddresslistWidget> createState() => _AddresslistWidgetState();
}

class _AddresslistWidgetState extends State<AddresslistWidget> {
  late AddresslistModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, String>> addresses = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddresslistModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => loadAddresses());
  }

    Future<void> loadAddresses() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    // Fetch the document for the logged-in user based on userID
    final snapshot = await FirebaseFirestore.instance
        .collection('customer')
        .where('uid', isEqualTo: userId)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>; // Explicitly cast to Map<String, dynamic>

      List<Map<String, String>> fetchedAddresses = [];

      // Find the indices based on the address keys
      data.forEach((key, value) {
        final regex = RegExp(r'addressType_address(\d+)');
        final match = regex.firstMatch(key);
        if (match != null) {
          final index = int.parse(match.group(1)!);

          // Fetch address details using the index and cast values to String
          final addressDetails = {
            'index': index.toString(), // Store the index as a string (if needed)
            'addressType': (data['addressType_address$index'] ?? '').toString(),
            'address1': (data['address1_address$index'] ?? '').toString(),
            'address2': (data['address2_address$index'] ?? '').toString(),
            'city': (data['city_address$index'] ?? '').toString(),
            'country': (data['country_address$index'] ?? '').toString(),
          };

          // Add the address details to the list
          fetchedAddresses.add(addressDetails);
        }
      });

      // // Show the fetched addresses before sorting (as a toast)
      // Fluttertoast.showToast(
      //   msg: "Fetched Addresses (Before Sorting): $fetchedAddresses",
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.BOTTOM,
      // );

      // Now sort by the 'index' field directly
      fetchedAddresses.sort((a, b) {
        return int.parse(a['index']!).compareTo(int.parse(b['index']!)); // Sort by index directly
      });

      // Show the sorted addresses (as a toast)
      // Fluttertoast.showToast(
      //   msg: "Sorted Addresses: $fetchedAddresses",
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.BOTTOM,
      // );

      // Update the state with the sorted addresses
      setState(() {
        addresses = fetchedAddresses.map((address) {
          return {
            'addressType': address['addressType']!,
            'address1': address['address1']!,
            'address2': address['address2']!,
            'city': address['city']!,
            'country': address['country']!,
          };
        }).toList();
      });
    } else {
      Fluttertoast.showToast(
        msg: 'No user data found.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

// Helper function to extract numeric index from the key
  int _extractIndexFromKey(String key) {
    final regex = RegExp(r'(\d+)'); // Extract digits from the key
    final match = regex.firstMatch(key);
    return match != null ? int.parse(match.group(0)!) : 0; // Default to 0 if no match
  }


  Future<void> deleteAddressInFirebase(int index) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    // Fetch the user document in Firestore based on userID
    final snapshot = await FirebaseFirestore.instance
        .collection('customer')
        .where('uid', isEqualTo: userId)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final docRef = snapshot.docs.first.reference;

      // Delete the address fields related to the given index
      await docRef.update({
        'addressType_address$index': FieldValue.delete(),
        'address1_address$index': FieldValue.delete(),
        'address2_address$index': FieldValue.delete(),
        'city_address$index': FieldValue.delete(),
        'country_address$index': FieldValue.delete(),
      });

      // Update the UI by removing the address locally
      setState(() {
        addresses.removeAt(index);
      });

      Fluttertoast.showToast(msg: "Address deleted successfully");
    } else {
      Fluttertoast.showToast(msg: "No user data found to delete.");
    }
  }


  void navigateToEditPage(Map<String, String> addressDetails, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyaddressWidget(),
        settings: RouteSettings(
          arguments: {'addressDetails': addressDetails, 'index': index},
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            'Address List',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, // Set the back button color to black
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80), // Leave space for the button
              child: addresses.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16), // Space between containers
                    child: Material(
                      color: Colors.white, // White background for the container
                      elevation: 4, // Adds shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Rounded corners
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color (white)
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address['addressType'] ?? 'Unknown',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black), // Black text
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${address['address1']}, ${address['address2']}',
                              style: TextStyle(color: Colors.black), // Black text
                            ),
                            Text(
                              '${address['city']}, ${address['country']}',
                              style: TextStyle(color: Colors.black), // Black text
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Color(0xFFFFA800)),
                                  onPressed: () => navigateToEditPage(address, index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () async {
                                    await deleteAddressInFirebase(index);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Positioned "Add New Address" button
            Positioned(
              top: 16,
              right: 16,
              child: FFButtonWidget(
                onPressed: () {
                  // Determine the next index for the new address
                  int nextIndex = addresses.length; // Continuous indexing assumed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyaddressWidget(),
                      settings: RouteSettings(
                        arguments: {'index': nextIndex},
                      ),
                    ),
                  );
                },
                text: 'Add New Address',
                icon: Icon(
                  Icons.add, // Plus icon
                  color: Color(0xFFFFA800), // Icon color
                  size: 20, // Icon size
                ),
                options: FFButtonOptions(
                  width: 180, // Adjusted width to accommodate the icon and text
                  height: 50,
                  color: Colors.white, // Button background color
                  textStyle: FlutterFlowTheme.of(context)
                      .titleMedium
                      .copyWith(color: Colors.black), // Text color
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}