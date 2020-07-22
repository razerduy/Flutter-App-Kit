import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProgressDialogLoading {
  ProgressDialogLoading({BuildContext context})
      : _context = context,
        pr = ProgressDialog(context) {
    pr.style(
        progressWidget: CircularProgressIndicator(),
        message: 'waiting',
    );
  }

  final BuildContext _context;
  final ProgressDialog pr;

  Future<bool> show() async {
    return await pr.show();
  }

  updateProgress(int sent, int total) {
    pr.update(
        message: 'uploading',
        progress: sent * 100.0 / total,
        maxProgress: 100.0,
    );
  }

  Future<bool> hide() async {
    return await pr.hide();
  }
}
