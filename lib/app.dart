// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import 'flavors.dart';
// import 'src/features/chart/presentation/pages/steps_chart_page.dart';
//
// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: F.title,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: _flavorBanner(
//         child: const StepsChartPage(),
//         show: kDebugMode,
//       ),
//     );
//   }
//
//   Widget _flavorBanner({
//     required Widget child,
//     bool show = true,
//   }) =>
//       show
//           ? Banner(
//               location: BannerLocation.topStart,
//               message: F.name,
//               color: (F.name == 'exampledev')
//                   ? Colors.red
//                   : Colors.green.withOpacity(0.6),
//               textStyle: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 12.0,
//                 letterSpacing: 1.0,
//               ),
//               textDirection: TextDirection.ltr,
//               child: child,
//             )
//           : SizedBox(
//               child: child,
//             );
// }
