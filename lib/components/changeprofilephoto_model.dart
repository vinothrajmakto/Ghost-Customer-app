import '/flutter_flow/flutter_flow_util.dart';
import 'changeprofilephoto_widget.dart' show ChangeprofilephotoWidget;
import 'package:flutter/material.dart';

class ChangeprofilephotoModel
    extends FlutterFlowModel<ChangeprofilephotoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
