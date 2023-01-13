// import 'dart:developer';
//
// import 'package:health/health.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../presentation/pages/health_page.dart';
//
// abstract class HealthRepoInterface {
//   factory HealthRepoInterface() => HealthRepo();
//
//   Future fetchData();
// }
//
// class HealthRepo implements HealthRepoInterface {
//   @override
//   Future fetchData() async {
//     AppState _state = AppState.DATA_NOT_FETCHED;
//     List<HealthDataPoint> _healthDataList = [];
//
//     HealthFactory health = HealthFactory();
//
//     setState(() => _state = AppState.FETCHING_DATA);
//
//     // define the types to get
//     final types = [
//       HealthDataType.STEPS,
//       HealthDataType.WEIGHT,
//       HealthDataType.HEIGHT,
//       HealthDataType.BLOOD_GLUCOSE,
//       HealthDataType.WORKOUT,
//       // Uncomment these lines on iOS - only available on iOS
//       // HealthDataType.AUDIOGRAM
//     ];
//
//     // with coresponsing permissions
//     final permissions = [
//       HealthDataAccess.READ,
//       HealthDataAccess.READ,
//       HealthDataAccess.READ,
//       HealthDataAccess.READ,
//       HealthDataAccess.READ,
//       // HealthDataAccess.READ,
//     ];
//
//     // get data within the last 24 hours
//     final now = DateTime.now();
//     final yesterday = now.subtract(const Duration(days: 1));
//     // requesting access to the data types before reading them
//     // note that strictly speaking, the [permissions] are not
//     // needed, since we only want READ access.
//     bool requested =
//         await health.requestAuthorization(types, permissions: permissions);
//     log('requested: $requested');
//
//     // If we are trying to read Step Count, Workout, Sleep or other data that requires
//     // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
//     // This requires a special request authorization call.
//     //
//     // The location permission is requested for Workouts using the Distance information.
//     await Permission.activityRecognition.request();
//     await Permission.location.request();
//
//     if (requested) {
//       try {
//         // fetch health data
//         List<HealthDataPoint> healthData =
//             await health.getHealthDataFromTypes(yesterday, now, types);
//         // save all the new data points (only the first 100)
//         _healthDataList.addAll((healthData.length < 100)
//             ? healthData
//             : healthData.sublist(0, 100));
//       } catch (error) {
//         log("Exception in getHealthDataFromTypes: $error");
//       }
//
//       // filter out duplicates
//       _healthDataList = HealthFactory.removeDuplicates(_healthDataList);
//
//       // log the results
//       for (var x in _healthDataList) {
//         log('$x');
//       }
//
//       // update the UI to display the results
//       setState(() {
//         _state =
//             _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
//       });
//     } else {
//       log("Authorization not granted");
//       setState(() => _state = AppState.DATA_NOT_FETCHED);
//     }
//   }
// }
