import 'package:flutter/material.dart';

InputDecoration getInputDecoration({String lebel, Widget icons}) {
  return InputDecoration(
    labelText: lebel,
    labelStyle: TextStyle(color:  AppColors.secondaryTextColor),
    enabledBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10.0),
      borderSide: new BorderSide(color: AppColors.secondaryTextColor),
    ),
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10.0),
      borderSide: new BorderSide(width: 4,color: AppColors.secondaryTextColor),
    ),
    focusedBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(10.0),
      borderSide: new BorderSide(color: AppColors.secondaryTextColor),
    ),
  );
  
}

ThemeData getThemeData() {
  return ThemeData(
    primaryColor: AppColors.secondary,
    canvasColor: AppColors.primary,
  );
}


MaterialColor createSwatch(int r, int g, int b, double o){
	Map<int, Color> swatch = {};
	List<int> opacities = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
	for(int opacity in opacities)
		swatch[opacity] = Color.fromRGBO(r, g, b, opacity/1000);
	return MaterialColor(
		Color.fromRGBO(r, g, b, o).value,
		swatch
	);
}

class AppColors{
	static final MaterialColor primary = createSwatch(15, 25, 38, 1);
  static final MaterialColor secondary = createSwatch(28, 41, 58, 1);
  static final MaterialColor tertiary = createSwatch(255, 255, 255, 1);  
  static final MaterialColor primaryTextColor = createSwatch(255, 85, 28, 1);
  static final MaterialColor secondaryTextColor = createSwatch(255, 255, 255, 1);
  // static final MaterialColor four = createSwatch(86, 218, 204, 1);
  // static final MaterialColor five = createSwatch(0, 13, 52, 1);
}