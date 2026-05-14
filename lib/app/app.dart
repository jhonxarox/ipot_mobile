import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

/// Root widget for the IPOT Mobile customer-ordering app.
///
/// Wired with [MaterialApp.router] so [GoRouter] owns navigation. Light and
/// dark themes are both provided; the OS-level brightness setting drives the
/// active palette via [ThemeMode.system].
class IpotMobileApp extends StatelessWidget {
  const IpotMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IPOT Mobile',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
