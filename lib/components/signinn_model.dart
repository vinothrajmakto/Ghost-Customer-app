import '/flutter_flow/flutter_flow_util.dart';
import 'signinn_widget.dart' show SigninnWidget;
import 'package:flutter/material.dart';

class SigninnModel extends FlutterFlowModel<SigninnWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
