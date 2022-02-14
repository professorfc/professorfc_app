part of 'home_cubit.dart';

class CalculateCoordinates {
  static const double _width_base = 411.4;
  static const double _height_base = 683.4;

  static double getRelativeWidth(double screenWidth, double value) {
    double fromValue1 = _width_base;
    double toValue1 = value;

    double fromValue2 = screenWidth;
    double? toValue2;

    toValue2 = (fromValue2 * toValue1) / fromValue1;

    return toValue2;
  }

  static double getRelativeHeight(double screenHeight, double value) {
    double fromValue1 = _height_base;
    double toValue1 = value;

    double fromValue2 = screenHeight;
    double? toValue2;

    toValue2 = (fromValue2 * toValue1) / fromValue1;

    return toValue2;
  }
}
