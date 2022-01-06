// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapView extends StatefulWidget {
//   const MapView({Key key}) : super(key: key);
//
//   @override
//   _MapViewState createState() => _MapViewState();
// }
//
// class _MapViewState extends State<MapView> {
//   // Initial location of the Map view
//   CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
//
// // For controlling the view of the Map
//   GoogleMapController mapController;
//
//   // For storing the current position
//   Position _currentPosition;
//
//   // Method for retrieving the current location
//
//   _getCurrentLocation() async {
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) async {
//       setState(() {
//         // Store the position in the variable
//         _currentPosition = position;
//
//         print('CURRENT POS: $_currentPosition');
//
//         // For moving the camera to current location
//         mapController.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(position.latitude, position.longitude),
//               zoom: 18.0,
//             ),
//           ),
//         );
//       });
//       // await _getCurrentLocation();
//     }).catchError((e) {
//       print(e);
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Determining the screen width & height
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Container(
//       height: height,
//       width: width,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             GoogleMap(
//               initialCameraPosition: _initialLocation,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: false,
//               mapType: MapType.normal,
//               zoomGesturesEnabled: true,
//               zoomControlsEnabled: false,
//               onMapCreated: (GoogleMapController controller) {
//                 mapController = controller;
//               },
//             ),
//             ClipOval(
//               child: Material(
//                 color: Colors.orange.shade100, // button color
//                 child: InkWell(
//                   splashColor: Colors.orange, // inkwell color
//                   child: const SizedBox(
//                     width: 56,
//                     height: 56,
//                     child: Icon(Icons.my_location),
//                   ),
//                   onTap: () {
//                     // Zoom In action
//                     mapController.animateCamera(
//                       CameraUpdate.zoomIn(),
//                     );
//
//                     // Zoom Out action
//                     mapController.animateCamera(
//                       CameraUpdate.zoomOut(),
//                     );
//                     mapController.animateCamera(
//                       CameraUpdate.newCameraPosition(
//                         CameraPosition(
//                           target: LatLng(
//                             // Will be fetching in the next step
//                             _currentPosition.latitude,
//                             _currentPosition.longitude,
//                           ),
//                           zoom: 18.0,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
