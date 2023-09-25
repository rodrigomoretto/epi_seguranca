// import 'package:epi_test/util/constants/constants.dart' as constants;
// import 'package:flutter/material.dart';

// class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
//   const DefaultAppBar({super.key});

//   @override
//   State<DefaultAppBar> createState() => _DefaultAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(64);
// }

// class _DefaultAppBarState extends State<DefaultAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // backgroundColor: Theme.of(context).colorScheme.primary,
//       title: Text(constants.appName.toUpperCase(),),
//     );
//   }
// }

import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:flutter/material.dart';

AppBar customAppBar = AppBar(
  title: Text(ApplicationConstants.appName.toUpperCase()),
);
