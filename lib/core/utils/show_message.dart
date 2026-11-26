  import 'package:flutter/material.dart';

  import 'app_colors.dart';

  void showMessage(
    String message,
    BuildContext context, [
    StatusType statusType = StatusType.success,
  ]) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: statusType == StatusType.success
              ? AppColors.successColor
              : AppColors.errorColor,
        ),
      );
  }

  enum StatusType { error, success }
