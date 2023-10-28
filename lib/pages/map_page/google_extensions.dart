import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satellite_app/pages/map_page/map_objects.dart';

extension LatLngConverter on MapPoint{
  LatLng toLatLng(){
    return LatLng(lat, lon);
  }
}