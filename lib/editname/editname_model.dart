import '/flutter_flow/flutter_flow_util.dart';
import 'editname_widget.dart' show EditnameWidget;
import 'package:flutter/material.dart';

class EditnameModel extends FlutterFlowModel<EditnameWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();
  }
}
