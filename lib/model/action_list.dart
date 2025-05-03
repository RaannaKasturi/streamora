import 'package:flutter/widgets.dart';

class ActionListData {
  final String actionName;
  final IconData leadingIcon;
  final Widget actionScreen;

  ActionListData({
    required this.actionName,
    required this.leadingIcon,
    required this.actionScreen,
  });
}
