import 'package:flutter/material.dart';

import '../features/microsoft_auth/presentation/pages/microsoft_auth_page.dart';
import '../features/provider_overview/presentation/pages/show_me_counter_page.dart';
import '../features/provider_overview/presentation/pages/tutorial_19_page.dart';

Map<String, WidgetBuilder> routes() {
  return {
    '/tutorial-19': (context) => Tutorial19Page(),
    '/show-me-counter': (context) => const ShowMeCounterPage(),
    '/microsoft': (context) => const MicrosoftAuthPage(),
  };
}
