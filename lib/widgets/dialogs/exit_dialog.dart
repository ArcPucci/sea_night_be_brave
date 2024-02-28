import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Leave the game?',
        style: AppTextStyles.dialogTitle,
      ),
      content: Text(
        'You will lose everything you have gained',
        style: AppTextStyles.dialogContent,
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: Navigator.of(context).pop,
          child: Text(
            'Cancel',
            style: AppTextStyles.dialogTitle.copyWith(
              color: AppTheme.systemBlue,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            context.pop();
          },
          child: Text(
            'Leave',
            style: AppTextStyles.dialogTitle.copyWith(
              color: AppTheme.systemRed,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
