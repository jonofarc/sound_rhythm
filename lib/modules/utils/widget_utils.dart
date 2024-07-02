import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/utils/app_text_style.dart';
import 'package:sound_rhythm/modules/utils/app_utils.dart';

import '../utils/constants.dart';

class WidgetUtils {
  AppBar getDefaultAppbar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(appName,
          style: AppTextStyle.headingH2.withColor(defaultTextColor)),
    );
  }

  AppBar getLogOutAppbar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [_logoutButton(defaultTextColor, context)],
      automaticallyImplyLeading: false,
    );
  }

  Widget _logoutButton(Color color, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: TextButton(
        onPressed: () {
          AppUtils().doLogout(context);
        },
        child: Text(
          "Logout",
          style: AppTextStyle.button.withColor(color),
        ),
      ),
    );
  }
}
