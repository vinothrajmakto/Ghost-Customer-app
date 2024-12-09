import '/flutter_flow/flutter_flow_util.dart';
import 'editmobilenumber_widget.dart' show EditmobilenumberWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditmobilenumberModel extends FlutterFlowModel<EditmobilenumberWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for mobilenum widget.
  FocusNode? mobilenumFocusNode;
  TextEditingController? mobilenumTextController;
  final mobilenumMask = MaskTextInputFormatter(mask: '+##-##########');
  String? Function(BuildContext, String?)? mobilenumTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mobilenumFocusNode?.dispose();
    mobilenumTextController?.dispose();
  }
}
