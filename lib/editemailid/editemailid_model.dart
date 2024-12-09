import '/flutter_flow/flutter_flow_util.dart';
import 'editemailid_widget.dart' show EditemailidWidget;
import 'package:flutter/material.dart';

class EditemailidModel extends FlutterFlowModel<EditemailidWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
