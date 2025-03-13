import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

StatusCardModelStruct? getCardValue(String? type) {
  Map<String, Map<String, dynamic>> listOfVitals = {
    "Height": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/height-icon.png",
      "unit": "cm",
      "label": "Height",
      "range": "50 - 250", // in cm
      "type": "Height"
    },
    "Weight": {
      "color": Color(0x151F7A1F), // Dark green with opacity
      "iconColor": Color(0xFF1F7A1F), // Dark green
      "icon": "assets/icons/weight-icon.png",
      "unit": "kg",
      "label": "Weight",
      "range": "2 - 200", // in kg
      "type": "Weight"
    },
    "BMI": {
      "color": Color(0x153357FF),
      "iconColor": Color(0xFF3357FF),
      "icon": "assets/icons/bmi-icon.png",
      "unit": "kg/m²",
      "label": "BMI",
      "range": "10 - 40", // in kg/m²
      "type": "Bmi"
    },
    "CardiacOutput": {
      "color": Color(0x15FF7F50), // Dark orange with opacity
      "iconColor": Color(0xFFFF7F50),
      "icon": "assets/icons/bmi-icon.png",
      "unit": "rate/sec",
      "label": "Cardiac Output",
      "range": "2000 - 4000", // in kg/m²
      "type": "CardiacOutput"
    },
    "WaistCircumference": {
      "color": Color(0x15FF33A6),
      "iconColor": Color(0xFFFF33A6),
      "icon": "assets/icons/waist-icon.png",
      "unit": "cm",
      "label": "Waist Circumference",
      "range": "20 - 150", // in cm
      "type": "WaistCircumference"
    },
    "HipCircumference": {
      "color": Color(0x15A633FF),
      "iconColor": Color(0xFFA633FF),
      "icon": "assets/icons/hip-icon.png",
      "unit": "cm",
      "label": "Hip Circumference",
      "range": "30 - 160", // in cm
      "type": "HipCircumference"
    },
    "WaistToHipRatio": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/ratio-icon.png",
      "unit": " ",
      "label": "Waist to Hip Ratio",
      "range": "0.5 - 1.2", // ratio
      "type": "WaistToHipRatio"
    },
    "StepCount": {
      "color": Color(0x1533A6FF),
      "iconColor": Color(0xFF33A6FF),
      "icon": "assets/icons/steps-icon.png",
      "unit": "steps",
      "label": "Step Count",
      "range": "0 - 30000", // number of steps
      "type": "Step Count"
    },
    "WaterIntake": {
      "color": Color(0x153357FF),
      "iconColor": Color(0xFF3357FF),
      "icon": "assets/icons/steps-icon.png",
      "unit": "liters",
      "label": "Water Intake",
      "range": "1 - 10", // number of steps
      "type": "WaterIntake"
    },
    "BloodPressure": {
      "color": Color(0x154B0082),
      "iconColor": Color(0xFF4B0082),
      "icon": "assets/icons/blood-pressure-icon.png",
      "unit": "mmHg",
      "label": "Blood Pressure",
      "range": "80 - 180", // systolic blood pressure in mmHg
      "type": "BloodPressure"
    },
    "HeartRate": {
      "color": Color(0x15555155),
      "iconColor": Color(0xFF551555),
      "icon": "assets/icons/heart-rate-icon.png",
      "unit": "bpm",
      "label": "Heart Rate",
      "range": "40 - 180", // in bpm
      "type": "HeartRate"
    },
    "BodyTemperature": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/temperature-icon.png",
      "unit": "°F",
      "label": "Body Temperature",
      "range": "35 - 42", // in °C
      "type": "BodyTemperature"
    },
    "BloodGlucose": {
      "color": Color(0x1533A6FF),
      "iconColor": Color(0xFF33A6FF),
      "icon": "assets/icons/glucose-icon.png",
      "unit": "mg/dL",
      "label": "Blood Glucose",
      "range": "70 - 200", // in mg/dL
      "type": "BloodGlucose"
    },
    "SpO2": {
      "color": Color(0x155733FF),
      "iconColor": Color(0xFF5733FF),
      "icon": "assets/icons/sp02-icon.png",
      "unit": "%",
      "label": "SpO2",
      "range": "85 - 100", // in percentage
      "type": "SpO2"
    },
    "Sleep": {
      "color": Color(0x15FF33FF),
      "iconColor": Color(0xFFFF33FF),
      "icon": "assets/icons/sleep-icon.png",
      "unit": "hours",
      "label": "Sleep",
      "range": "0 - 24", // in hours
      "type": "Sleep"
    },
    "CardiacOutput": {
      "color": Color(0x151C1C1C),
      "iconColor": Color(0xFF1C1C1C),
      "icon": "assets/icons/cardiac-output-icon.png",
      "unit": "L/min",
      "label": "Cardiac Output",
      "range": "3 - 8", // in L/min
      "type": "CardiacOutput"
    },
    "MeanArterialPressure": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/map-icon.png",
      "unit": "mmHg",
      "label": "Mean Arterial Pressure",
      "range": "60 - 120", // in mmHg
      "type": "MeanArterialPressure"
    },
    "VO2Max": {
      "color": Color(0x15C71585), // Lavender with opacity
      "iconColor": Color(0xFFC71585),
      "icon": "assets/icons/vo2max-icon.png",
      "unit": "ml/kg/min",
      "label": "VO2 Max",
      "range": "15 - 60", // in ml/kg/min
      "type": "VO2Max"
    },
    "RespirationRate": {
      "color": Color(0x155733A6),
      "iconColor": Color(0xFF5733A6),
      "icon": "assets/icons/respiration-icon.png",
      "unit": "breaths/min",
      "label": "Respiration Rate",
      "range": "12 - 20", // in breaths/min
      "type": "RespirationRate"
    },
    "TotalBodyWater": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/tbw-icon.png",
      "unit": "L",
      "label": "Total Body Water",
      "range": "30 - 50", // in liters
      "type": "TotalBodyWater"
    },
    "BodyWater": {
      "color": Color(0x151F3A93), // Dark blue with opacity
      "iconColor": Color(0xFF1F3A93), // Dark blue
      "icon": "assets/icons/body-water-icon.png",
      "unit": "%",
      "label": "Body Water",
      "range": "20 - 45", // in liters
      "type": "BodyWater"
    },
    "BloodVolume": {
      "color": Color(0x1533A6FF),
      "iconColor": Color(0xFF33A6FF),
      "icon": "assets/icons/blood-volume-icon.png",
      "unit": "ml",
      "label": "Blood Volume",
      "range": "4 - 6", // in liters
      "type": "BloodVolume"
    },
    "TotalBodyFat": {
      "color": Color(0x15A633FF),
      "iconColor": Color(0xFFA633FF),
      "icon": "assets/icons/body-fat-icon.png",
      "unit": "%",
      "label": "Total Body Fat",
      "range": "5 - 35", // in percentage
      "type": "TotalBodyFat"
    },
    "WellbeingScore": {
      "color": Color(0x151F77B4),
      "iconColor": Color(0xFF1F77B4),
      "icon": "assets/icons/stress-icon.png",
      "unit": " ",
      "label": "Wellbeing Score",
      "range": "0 - 100", // arbitrary units
      "type": "WellbeingScore"
    },
    "StressIndex": {
      "color": Color(0x15FF7F0E),
      "iconColor": Color(0xFFFF7F0E),
      "icon": "assets/icons/stress-icon.png",
      "unit": "SI",
      "label": "Stress Index",
      "range": "0 - 100", // arbitrary units
      "type": "StressIndex"
    },
    "HrvSdnn": {
      "color": Color(0x152CA02C),
      "iconColor": Color(0xFF2CA02C),
      "icon": "assets/icons/stress-icon.png",
      "unit": "ms",
      "label": "SDNN",
      "range": "0 - 100", // arbitrary units
      "type": "HrvSdnn"
    },
    "HrvRmssd": {
      "color": Color(0x15D62728),
      "iconColor": Color(0xFFD62728),
      "icon": "assets/icons/stress-icon.png",
      "unit": "ms",
      "label": "RMSSD",
      "range": "0 - 100", // arbitrary units
      "type": "HrvRmssd"
    },
    "HrvPnn50": {
      "color": Color(0x1598DF8A),
      "iconColor": Color(0xFF98DF8A),
      "icon": "assets/icons/stress-icon.png",
      "unit": "%",
      "label": "PNN50",
      "range": "0 - 100", // arbitrary units
      "type": "HrvPnn50"
    },
    "FastingBloodGlucose": {
      "color": Color(0x15D62728),
      "iconColor": Color(0xFFD62728),
      "unit": "mg/dL",
      "label": "Fasting Blood Glucose",
      "type": "FastingBloodGlucose"
    },
    "RandomBloodGlucose": {
      "color": Color(0x151F7A1F), // Dark green with opacity
      "iconColor": Color(0xFF1F7A1F), // Dark green
      "unit": "mg/dL",
      "label": "Random Blood Glucose",
      "type": "RandomBloodGlucose"
    },
    "AfterBreakfastBloodGlucose": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "unit": "mg/dL",
      "label": "After Breakfast Blood Glucose",
      "type": "AfterBreakfastBloodGlucose"
    },
    "BeforeLunchBloodGlucose": {
      "color": Color(0x151C1C1C),
      "iconColor": Color(0xFF1C1C1C),
      "unit": "mg/dL",
      "label": "Before Lunch Blood Glucose",
      "type": "BeforeLunchBloodGlucose"
    },
    "BeforeDinnerBloodGlucose": {
      "color": Color(0x15555155),
      "iconColor": Color(0xFF551555),
      "unit": "mg/dL",
      "label": "Before Dinner Blood Glucose",
      "type": "BeforeDinnerBloodGlucose"
    },
    "AfterLunchBloodGlucose": {
      "color": Color(0x15A633FF),
      "iconColor": Color(0xFFA633FF),
      "unit": "mg/dL",
      "label": "After Lunch Blood Glucose",
      "type": "AfterLunchBloodGlucose"
    },
    "AfterDinnerBloodGlucose": {
      "color": Color(0x15D62728),
      "iconColor": Color(0xFFD62728),
      "unit": "mg/dL",
      "label": "After Dinner Blood Glucose",
      "type": "AfterDinnerBloodGlucose"
    },
    "HbA1c": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "unit": "%",
      "label": "HbA1c",
      "type": "HbA1c"
    },
    "BabyKickCount": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "unit": "kicks per day",
      "label": "Baby Kick Count",
      "type": "BabyKickCount"
    },
    "CaloriesBurned": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "unit": "kcal",
      "label": "Calories Burned",
      "type": "CaloriesBurned"
    }
  };

  StatusCardModelStruct? value;
  Map<String, dynamic>? attributes = listOfVitals[type];

  if (attributes != null) {
    value = StatusCardModelStruct(
        unit: attributes['unit'],
        color: attributes['color'],
        icon: attributes['icon'],
        label: attributes['label'],
        iconColor: attributes['iconColor'],
        range: attributes['range'],
        type: attributes['type']);
  } else {
    return StatusCardModelStruct(
        unit: 'No unit',
        color: Color(0x15FF33A6),
        icon: null,
        label: 'Value',
        iconColor: Color(0xFFFF33A6),
        range: 'No range',
        type: 'unknown');
    ;
  }

  return value;
}

StatusCardModelStruct? getCardValueApi(String? type) {
  Map<String, Map<String, dynamic>> listOfVitals = {
    "Height": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/height-icon.png",
      "unit": "cms",
      "range": "50 - 250", // in cm
      "type": "Height"
    },
    "Weight": {
      "color": Color(0x1533FF57),
      "iconColor": Color(0xFF33FF57),
      "icon": "assets/icons/weight-icon.png",
      "unit": "kg",
      "range": "2 - 200", // in kg
      "type": "Weight"
    },
    "BMI": {
      "color": Color(0x153357FF),
      "iconColor": Color(0xFF3357FF),
      "icon": "assets/icons/bmi-icon.png",
      "unit": "kg/m²",
      "range": "10 - 40", // in kg/m²
      "type": "BMI"
    },
    "Waist Circumference": {
      "color": Color(0x15FF33A6),
      "iconColor": Color(0xFFFF33A6),
      "icon": "assets/icons/waist-icon.png",
      "unit": "cms",
      "range": "20 - 150", // in cm
      "type": "WaistCircumference"
    },
    "Hip Circumference": {
      "color": Color(0x15A633FF),
      "iconColor": Color(0xFFA633FF),
      "icon": "assets/icons/hip-icon.png",
      "unit": "cms",
      "range": "30 - 160", // in cm
      "type": "HipCircumference"
    },
    "Waist to Hip Ratio": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/ratio-icon.png",
      "unit": "",
      "range": "0.5 - 1.2", // ratio
      "type": "WaistToHipRatio"
    },
    "Step Count": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/steps-icon.png",
      "unit": "",
      "range": "0 - 30000", // number of steps
      "type": "StepCount"
    },
    "Blood Pressure": {
      "color": Color(0x1533FFA6),
      "iconColor": Color(0xFF33FFA6),
      "icon": "assets/icons/blood-pressure-icon.png",
      "unit": "mmHg",
      "range": "80 - 180", // systolic blood pressure in mmHg
      "type": "BloodPressure"
    },
    "Heart Rate": {
      "color": Color(0x15A6FF33),
      "iconColor": Color(0xFFA6FF33),
      "icon": "assets/icons/heart-rate-icon.png",
      "unit": "bpm",
      "range": "40 - 180", // in bpm
      "type": "HeartRate"
    },
    "Body Temperature": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/temperature-icon.png",
      "unit": "°F",
      "range": "35 - 42", // in °C
      "type": "BodyTemperature"
    },
    "Blood Glucose": {
      "color": Color(0x1533A6FF),
      "iconColor": Color(0xFF33A6FF),
      "icon": "assets/icons/glucose-icon.png",
      "unit": "mg/dL",
      "range": "70 - 200", // in mg/dL
      "type": "BloodGlucose"
    },
    "SpO2": {
      "color": Color(0x155733FF),
      "iconColor": Color(0xFF5733FF),
      "icon": "assets/icons/sp02-icon.png",
      "unit": "%",
      "range": "85 - 100", // in percentage
      "type": "SpO2"
    },
    "Sleep": {
      "color": Color(0x15FF33FF),
      "iconColor": Color(0xFFFF33FF),
      "icon": "assets/icons/sleep-icon.png",
      "unit": "hours",
      "range": "0 - 24", // in hours
      "type": "Sleep"
    },
    "Water Intake": {
      "color": Color(0x15FF9743),
      "iconColor": Color(0xFFFF9743),
      "icon": "assets/icons/steps-icon.png",
      "unit": "liters",
      "label": "Water Intake",
      "range": "1 - 10", // number of steps
      "type": "WaterIntake"
    },
    "Cardiac Output": {
      "color": Color(0x1533FF96),
      "iconColor": Color(0xFF33FF96),
      "icon": "assets/icons/cardiac-output-icon.png",
      "unit": "L/min",
      "range": "3 - 8", // in L/min
      "type": "CardiacOutput"
    },
    "Mean Arterial Pressure": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/map-icon.png",
      "unit": "mmHg",
      "range": "60 - 120", // in mmHg
      "type": "MeanArterialPressure"
    },
    "VO2 Max": {
      "color": Color(0x1533FF57),
      "iconColor": Color(0xFF33FF57),
      "icon": "assets/icons/vo2max-icon.png",
      "unit": "ml/kg/min",
      "range": "15 - 60", // in ml/kg/min
      "type": "VO2Max"
    },
    "Respiration Rate": {
      "color": Color(0x155733A6),
      "iconColor": Color(0xFF5733A6),
      "icon": "assets/icons/respiration-icon.png",
      "unit": "breaths/min",
      "range": "12 - 20", // in breaths/min
      "type": "RespirationRate"
    },
    "Total Body Water": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/tbw-icon.png",
      "unit": "L",
      "range": "30 - 50", // in liters
      "type": "TotalBodyWater"
    },
    "Body Water": {
      "color": Color(0x1533FF96),
      "iconColor": Color(0xFF33FF96),
      "icon": "assets/icons/body-water-icon.png",
      "unit": "L",
      "range": "20 - 45", // in liters
      "type": "BodyWater"
    },
    "Blood Volume": {
      "color": Color(0x1533A6FF),
      "iconColor": Color(0xFF33A6FF),
      "icon": "assets/icons/blood-volume-icon.png",
      "unit": "L",
      "range": "4 - 6", // in liters
      "type": "BloodVolume"
    },
    "Total Body Fat": {
      "color": Color(0x15A633FF),
      "iconColor": Color(0xFFA633FF),
      "icon": "assets/icons/body-fat-icon.png",
      "unit": "%",
      "range": "5 - 35", // in percentage
      "type": "TotalBodyFat"
    },
    "Stress Index": {
      "color": Color(0x15FF33A6),
      "iconColor": Color(0xFFFF33A6),
      "icon": "assets/icons/stress-icon.png",
      "unit": "",
      "range": "0 - 100", // arbitrary units
      "type": "StressIndex"
    },
    "Fasting Blood Glucose": {
      "unit": "mg/dL",
      "label": "Fasting Blood Glucose",
      "type": "FastingBloodGlucose"
    },
    "Random Blood Glucose": {
      "unit": "mg/dL",
      "label": "Random Blood Glucose",
      "type": "RandomBloodGlucose"
    },
    "After Breakfast Blood Glucose": {
      "unit": "mg/dL",
      "label": "After Breakfast Blood Glucose",
      "type": "AfterBreakfastBloodGlucose"
    },
    "Before Lunch Blood Glucose": {
      "unit": "mg/dL",
      "label": "Before Lunch Blood Glucose",
      "type": "BeforeLunchBloodGlucose"
    },
    "Before Dinner Blood Glucose": {
      "unit": "mg/dL",
      "label": "Before Dinner Blood Glucose",
      "type": "BeforeDinnerBloodGlucose"
    },
    "After Lunch Blood Glucose": {
      "unit": "mg/dL",
      "label": "After Lunch Blood Glucose",
      "type": "AfterLunchBloodGlucose"
    },
    "After Dinner Blood Glucose": {
      "unit": "mg/dL",
      "label": "After Dinner Blood Glucose",
      "type": "AfterDinnerBloodGlucose"
    },
    "HbA1c": {"unit": "%", "label": "HbA1c", "type": "HbA1c"},
    "Baby Kick Count": {
      "unit": "kick per day",
      "label": "Baby Kick Count",
      "type": "BabyKickCount"
    },
  };

  StatusCardModelStruct? value;
  Map<String, dynamic>? attributes = listOfVitals[type];

  if (attributes != null) {
    value = StatusCardModelStruct(
        unit: attributes['unit'],
        color: attributes['color'],
        icon: attributes['icon'],
        label: attributes['label'],
        iconColor: attributes['iconColor'],
        range: attributes['range'],
        type: attributes['type']);
  } else {
    return null;
  }

  return value;
}

DateTime convertStringToDate(String dateString) {
  DateTime utcDate = DateTime.parse(dateString).toUtc();
  DateTime localDate = utcDate.toLocal();
  return localDate;
}

String getQuotaStatus(
  String jsonData,
  String category,
  String subCategory,
) {
  final Map<String, dynamic> parsedJson = jsonDecode(jsonData);

  if (parsedJson['quotas'] != null && parsedJson['quotas']['quotas'] != null) {
    final quotas = parsedJson['quotas']['quotas'];
    if (quotas.containsKey(category)) {
      final categoryQuotas = quotas[category] as List<dynamic>;
      for (var quotaEntry in categoryQuotas) {
        if (quotaEntry['quotaType'] == subCategory && quotaEntry['quota'] > 0) {
          return "quotaAvailable";
        } else {
          return "subscriptionEnded";
        }
      }
    } else {
      return "notSubscribed";
    }
  }
  return "";
}

int differenceBetweenDate(
  DateTime from,
  DateTime to,
) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round() + 1;
}

int calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;

  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }

  return age;
}

String getFirstValue(
  String dosage,
  String seperator,
) {
  return dosage.split(seperator)[0];
}

String getSecondValue(
  String dosage,
  String seperator,
) {
  return dosage.split(seperator)[1];
}

DateTime calculateEndDate(
  DateTime startDate,
  int period,
) {
  if (period > 0) {
    return startDate.add(Duration(days: period - 1));
  }
  return startDate;
}

String getRangeStatus(
  String vitalName,
  String value,
) {
  final Map<String, List<Map<String, dynamic>>> ranges = {
    // "Height": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 150,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 200,
    //     "label": "High",
    //   },
    // ],
    // "Weight": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 50,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 100,
    //     "label": "High",
    //   },
    // ],
    "BMI": [
      {
        "point": 0,
        "label": "Low",
      },
      {
        "point": 18.4,
        "label": "Normal",
      },
      {
        "point": 24.9,
        "label": "High",
      },
      {
        "point": 29.9,
        "label": "Obese",
      },
      {
        "point": 40,
        "label": "Obese",
      },
    ],
    // "WaistCircumference": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 80,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 94,
    //     "label": "High",
    //   },
    // ],
    // "HipCircumference": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 100,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 120,
    //     "label": "High",
    //   },
    // ],
    // "WaistToHipRatio": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 0.85,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 1,
    //     "label": "High",
    //   },
    // ],
    "BloodPressure": [
      {
        "point": 30,
        "label": "Low",
      },
      {
        "point": 120,
        "label": "Normal",
      },
      {
        "point": 140,
        "label": "High",
      },
    ],
    "HeartRate": [
      {
        "point": 30,
        "label": "Low",
      },
      {
        "point": 60,
        "label": "Normal",
      },
      {
        "point": 100,
        "label": "High",
      },
    ],
    "BodyTemperature": [
      {
        "point": 0,
        "label": "Low",
      },
      {
        "point": 36.5,
        "label": "Normal",
      },
      {
        "point": 37.5,
        "label": "High",
      },
    ],
    // "BloodGlucose": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 70,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 100,
    //     "label": "High",
    //   },
    // ],
    "SpO2": [
      {
        "point": 95,
        "label": "Low",
      },
      {
        "point": 100,
        "label": "Normal",
      },
      {
        "point": 91,
        "label": "High",
      },
    ],
    // "Sleep": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 7,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 9,
    //     "label": "High",
    //   },
    // ],
    "CardiacOutput": [
      {
        "point": 1,
        "label": "Low",
      },
      {
        "point": 4,
        "label": "Normal",
      },
      {
        "point": 8,
        "label": "High",
      },
    ],
    "MeanArterialPressure": [
      {
        "point": 1,
        "label": "Low",
      },
      {
        "point": 70,
        "label": "Normal",
      },
      {
        "point": 100,
        "label": "High",
      },
    ],
    // "VO2Max": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 35,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 50,
    //     "label": "High",
    //   },
    // ],
    "RespirationRate": [
      {
        "point": 12,
        "label": "Low",
      },
      {
        "point": 20,
        "label": "Normal",
      },
      {
        "point": 40,
        "label": "High",
      },
    ],
    // "TotalBodyWater": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 50,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 70,
    //     "label": "High",
    //   },
    // ],
    // "BodyWater": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 50,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 70,
    //     "label": "High",
    //   },
    // ],
    // "BloodVolume": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 4,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 6,
    //     "label": "High",
    //   },
    // ],
    // "TotalBodyFat": [
    //   {
    //     "point": 0,
    //     "label": "Low",
    //   },
    //   {
    //     "point": 20,
    //     "label": "Normal",
    //   },
    //   {
    //     "point": 25,
    //     "label": "High",
    //   },
    // ],
    "StressIndex": [
      {
        "point": 0,
        "label": "Low",
      },
      {
        "point": 0.5,
        "label": "Normal",
      },
      {
        "point": 5,
        "label": "High",
      },
    ],
  };

  double? valueN = double.tryParse(value);
  if (valueN == null) {
    return "Unknown Vital";
  }

  List<Map<String, dynamic>>? range = ranges[vitalName];
  if (range == null) {
    return "Unknown Vital";
  }

  for (int i = 0; i < range.length; i++) {
    if (valueN <= range[i]["point"]) {
      return range[i]["label"];
    }
  }

  // Return the last label if the value exceeds all defined points
  return range.last["label"];
}

int getQuotaCount(
  String jsonData,
  String category,
  String subCategory,
) {
  final Map<String, dynamic> parsedJson = jsonDecode(jsonData);

  if (parsedJson['quotas'] != null && parsedJson['quotas']['quotas'] != null) {
    final quotas = parsedJson['quotas']['quotas'];
    if (quotas.containsKey(category)) {
      final categoryQuotas = quotas[category] as List<dynamic>;
      for (var quotaEntry in categoryQuotas) {
        if (quotaEntry['quotaType'] == subCategory) {
          return quotaEntry['quota'];
        } else {
          return 0;
        }
      }
    } else {
      return 0;
    }
  }
  return 0;
}

List<dynamic> groupReportsByType(dynamic data) {
  if (data == null) return [];
  // Create a map to hold grouped data
  Map<String, List<Map<String, dynamic>>> groupedData = {};
  print(data);
  // Iterate over each report in the data
  for (var report in data) {
    String reportType = report['reportType'];

    // Check if the reportType key exists in groupedData
    if (!groupedData.containsKey(reportType)) {
      groupedData[reportType] = []; // Initialize list if it doesn't exist
    }

    // Add the current report to the corresponding reportType group
    groupedData[reportType]!.add({
      'internalId': report['internalId'],
      'externalId': report['externalId'],
      'name': report['name'],
      'path': report['path'],
      'extension': report['extension'],
      'size': report['size'],
      'reportType': report['reportType'],
      'description': report['description'],
      'updatedAt': report['updatedAt'],
      'fileSignedURL': report['fileSignedURL'],
      'id': report['id'],
      "upload_date": report['upload_date'],
      "documentType": report['documentType']
    });
  }

  // Convert groupedData to a list of maps for each category
  List<Map<String, dynamic>> result = groupedData.entries.map((entry) {
    return {
      'category': entry.key,
      'list': entry.value,
    };
  }).toList();
  print(result);
  return result;
}

bool isTokenExpired(int unixTimestamp) {
  int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  return unixTimestamp < currentTime;
}

List<double> extractListofValues(dynamic jsonString) {
  List<dynamic> jsonArray = jsonString;
  List<double> values = [];
  for (var entry in jsonArray) {
    if (entry['value'] != null) {
      values.add(double.parse(entry['value'].toString()));
    }
  }
  return values;
}

List<int> extractListofDates(dynamic jsonString) {
  List<dynamic> jsonArray = jsonDecode(jsonString);

  List<int> dates = [];

  for (var entry in jsonArray) {
    if (entry['date'] != null) {
      DateTime dateUtc = DateTime.parse(entry['date']);
      DateTime dateLocal = dateUtc.toLocal();
      dates.add(dateLocal.millisecondsSinceEpoch);
    }
  }
  return dates;
}

bool regExForDosage(String dosage) {
  RegExp re = RegExp(r"^(0\.[1-9]\d*|[1-9]\d*(\.\d+)?)$");
  return re.hasMatch(dosage);
}

bool regForMedication(String medication) {
  RegExp re = RegExp(r"^[a-zA-Z0-9,.()/\-\+' +\s!@#\$%\^&\*]+$");
  return re.hasMatch(medication);
}

String regForEscaping(String value) {
  return value
      .replaceAll(r'\', r'\\')
      .replaceAll('\n', '\\n')
      .replaceAll('"', r'\"');
}

List<String> addLoadMore(
  List<ResultsStruct> items,
  bool isLoadMore,
) {
  List<String> fullNames =
      List.generate(items.length, (index) => items[index].shortName);

  if (isLoadMore) {
    fullNames.add('Load More');
  }
  return fullNames;
}

List<ResultsStruct> mergeResults(
  List<ResultsStruct> item,
  List<ResultsStruct> newitem,
) {
  List<ResultsStruct> combinedItems =
      newitem != null ? [...item, ...newitem] : [...item];
  return combinedItems;
}

DateTime nextMidnightEndDate(DateTime endDate) {
  DateTime end = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);
  print(end);
  return end;
}

String validateAndFormatNumber(String input) {
  if (input.isEmpty) {
    return '00';
  }

  int? number = int.tryParse(input);
  return number.toString().padLeft(2, '0');
}

String escapeDoubleQuotes(String input) {
  return input.replaceAllMapped(RegExp(r'"'), (match) => r'\"');
}

List<String> sortFrequency(List<String> frequency) {
  List<String> lst = List.filled(4, "", growable: false);
  List<String> result = [];
  for (int i = 0; i < frequency.length; i++) {
    if (frequency[i] == "SOS") {
      return frequency;
    } else if (frequency[i] == "Morning") {
      lst[0] = "Morning";
    } else if (frequency[i] == "Afternoon") {
      lst[1] = "Afternoon";
    } else if (frequency[i] == "Evening") {
      lst[2] = "Evening";
    } else {
      lst[3] = "Night";
    }
  }
  result = lst.where((e) => e.isNotEmpty).toList();
  return result;
}

dynamic checkForUpdate(
  String oldHeight,
  String newHeight,
  String oldWeight,
  String newWeight,
) {
  // Initialize an empty Map to store the JSON object.
  Map<String, dynamic> jsonObject = {};

  // Flag to check if an update is needed.
  bool updateNeeded = false;

  // Check if the new height is different from the old height.
  if (oldHeight != newHeight) {
    jsonObject['height'] = newHeight;
    updateNeeded = true;
  }

  // Check if the new weight is different from the old weight.
  if (oldWeight != newWeight) {
    jsonObject['weight'] = newWeight;
    updateNeeded = true;
  }

  // Return the JSON object if an update is needed, otherwise return null.
  return updateNeeded ? jsonObject : null;
}

String roundOf(String number) {
  double y = double.parse(number);
  if (y == y.toInt()) {
    return y.toInt().toString(); // Return whole number if no decimal part
  } else {
    return y.toStringAsFixed(2); // Return number with 2 decimals
  }
}

bool checkObjectHasValues(VitalsStruct body) {
  return false;
}

VitalsStruct findVital(
  TargetStruct goal,
  List<VitalsStruct> vitalsList,
) {
  for (VitalsStruct vital in vitalsList) {
    if (vital.type == goal.vitalType) {
      return vital;
    }
  }
  return VitalsStruct(type: goal.vitalType, value: "-");
}

List<VitalsStruct> checkVitalInCategory(
  String category,
  List<VitalsStruct> vitalsList,
) {
  final Map<String, List<String>> categoryVitalsMap = {
    "Key Body Vitals": [
      "SpO2",
      "Sleep",
      "StepCount",
      "WaterIntake",
      "RespirationRate",
      "BloodPressure",
      "HeartRate",
      "BodyTemperature",
      "CaloriesBurned"
    ],
    "Stress": ["StressIndex"],
    "Heart Health": [
      "HrvPnn50",
      "HrvRmssd",
      "HrvSdnn",
      "VO2Max",
      "CardiacOutput",
      "MeanArterialPressure"
    ],
    "Physiological": [
      "WaistCircumference",
      "HipCircumference",
      "Height",
      "Weight",
      "BMI",
      "WaistToHipRatio",
      "TotalBodyWater",
      "BodyWater",
      "BloodVolume",
      "TotalBodyFat"
    ],
    "Blood Glucose": [
      "FastingBloodGlucose",
      "RandomBloodGlucose",
      "AfterBreakfastBloodGlucose",
      "BeforeLunchBloodGlucose",
      "BeforeDinnerBloodGlucose",
      "AfterLunchBloodGlucose",
      "AfterDinnerBloodGlucose",
      "HbA1c"
    ],
    "Fetal Health": ["BabyKickCount"],
    "Diabetes Risk": ["DiabetesRisk"]
  };

  List<VitalsStruct> matchingVitals = [];

  if (categoryVitalsMap.containsKey(category)) {
    for (var vital in vitalsList) {
      if (categoryVitalsMap[category]!.contains(vital.type)) {
        matchingVitals.add(vital);
      }
    }
  }
  return matchingVitals;
}

String addNewLineIfNecessary(
  String text,
  double screenWidth,
) {
  final halfScreenWidth = screenWidth * 0.6;

  // Initialize variables
  String result = '';
  double currentLineWidth = 0.0;
  List<String> words = text.split(' ');

  for (var word in words) {
    // Approximate width of the word based on its character count
    final wordWidth =
        word.length * 6.0; // Adjust this multiplier as needed for your font

    // Check if adding the word would exceed half the screen width
    if (currentLineWidth + wordWidth > halfScreenWidth) {
      // If it exceeds, add a new line before adding the word
      result += '\n';
      currentLineWidth = 0.0;
    } else if (currentLineWidth > 0) {
      // Add a space before the word if it's not the first word in the line
      result += ' ';
      currentLineWidth += 6.0; // Approximate space width
    }

    // Add the word to the result
    result += word;
    currentLineWidth += wordWidth;
  }

  return result;
}

bool isAValidNumber(String input) {
  final numberRegex = RegExp(r'^\d+$');
  return numberRegex.hasMatch(input);
}

String adjustDateTime(
  DateTime inputDateTime,
  String key,
) {
  /// Check if the inputDateTime is the current date
  DateTime now = DateTime.now();

  // Calculate the DateTime for the start or end of the day
  DateTime adjustedDateTime;
  if (key == "start") {
    adjustedDateTime = DateTime(
        inputDateTime.year, inputDateTime.month, inputDateTime.day, 0, 1, 0);
  } else if (key == "end") {
    adjustedDateTime = DateTime(
        inputDateTime.year, inputDateTime.month, inputDateTime.day, 23, 59, 0);
  } else {
    throw ArgumentError("Invalid key. Use 'start' or 'end'.");
  }

  String isoString = '${adjustedDateTime.year.toString().padLeft(4, '0')}-'
      '${adjustedDateTime.month.toString().padLeft(2, '0')}-'
      '${adjustedDateTime.day.toString().padLeft(2, '0')}T'
      '${adjustedDateTime.hour.toString().padLeft(2, '0')}:'
      '${adjustedDateTime.minute.toString().padLeft(2, '0')}:'
      '${adjustedDateTime.second.toString().padLeft(2, '0')}'
      'Z';

  print("Adjusted DateTime: $adjustedDateTime");
  print("ISO 8601 String: $isoString");

  return isoString;
}

List<String> appendStringToList(
  List<String> originalList,
  String newString,
) {
  if (newString == "None of the above") {
    originalList.clear();
    originalList.add(newString);
  } else {
    if (originalList.contains(newString)) {
      originalList.remove(newString);
    } else {
      originalList.remove("None of the above");
      originalList.add(newString);
    }
  }
  return originalList;
}

String convertLocalDateTimeToUtcMilliseconds(DateTime localDateTime) {
  int localMilliseconds = localDateTime.millisecondsSinceEpoch;

  // Convert milliseconds to string
  print("local milliseconds: ${localMilliseconds.toString()}");
  print("local milliseconds: ${localDateTime}");
  return localMilliseconds.toString();
}

DateTime convertisotolocaldate(String isoString) {
  DateTime utcDateTime = DateTime.parse(isoString);

  // Convert the DateTime to the local time zone
  DateTime localDateTime = utcDateTime.toLocal();

  return localDateTime;
}

List<dynamic> createSurveyRequest(
  List<SurveyModelStruct> surveys,
  String doctorId,
) {
  List<Map<String, String>> surveyData = surveys.where((survey) {
    // Check if selectedoptions exists and is not empty
    return survey.selectedoptions != null && survey.selectedoptions.isNotEmpty;
  }).map((survey) {
    String answer = survey.selectedoptions.length > 1
        ? survey.selectedoptions.join(', ')
        : survey.selectedoptions.first;

    return {'question': survey.question, 'answer': answer};
  }).toList();

  // Return the JSON-encoded response
  return surveyData;
}

String? timeToGo(
  DateTime startDateTime,
  DateTime endDateTime,
) {
  final currentTime = DateTime.now();

  if (currentTime.isAfter(endDateTime)) {
    return "completed"; // Handle case where the event has ended
  } else if (currentTime.isAfter(startDateTime)) {
    return "live"; // Handle case where the event is ongoing
  }

  final difference = startDateTime.difference(currentTime);

  if (difference.isNegative) {
    return "Time has passed"; // Handle case where the time has already passed
  } else if (difference.inDays >= 2) {
    return "${difference.inDays} days to go";
  } else if (difference.inDays >= 1) {
    return "1 day to go";
  } else if (difference.inHours >= 2) {
    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;
    return minutes > 0
        ? "$hours hours $minutes minutes to go"
        : "$hours hours to go";
  } else if (difference.inHours >= 1) {
    final minutes = difference.inMinutes % 60;
    return minutes > 0 ? "1 hour $minutes minutes to go" : "1 hour to go";
  } else if (difference.inMinutes >= 2) {
    return "${difference.inMinutes} minutes to go";
  } else if (difference.inMinutes >= 1) {
    return "1 minute to go";
  } else {
    return "${difference.inSeconds} seconds to go";
  }
}

String? formatMedicationString(
  String dosage,
  List<String> freq,
  String period,
  String instruction,
  String units,
) {
  List<String> pattern = [];
  bool isSOS = false;

  for (String f in freq) {
    if (f == "SOS") {
      isSOS = true;
      pattern = ["SOS"];
      break;
    } else if (f == "Morning") {
      pattern.add("1");
    } else if (f == "Afternoon") {
      pattern.add("1");
    } else if (f == "Evening") {
      pattern.add("1");
    } else {
      pattern.add("1");
    }
  }

  double total;
  if (isSOS) {
    total = double.parse(dosage);
  } else {
    int count = freq.length;
    total = double.parse(dosage) * int.parse(period) * count;
  }

  return isSOS
      ? "${roundOf(dosage)} ${units} | SOS | ${instruction} | total quantity ${roundOf(total.toString())} ${units}"
      : "${roundOf(dosage)} ${units} | ${pattern.join(", ")} | ${instruction} | ${period} days | total quantity ${roundOf(total.toString())} ${units}";
}

ColorPairStruct generateRandomColorPair(Color selectedColor) {
  Color primaryColor = selectedColor.withOpacity(1.0);

  Color secondaryColor = selectedColor.withOpacity(0.08);

  return ColorPairStruct(
      primaryColor: primaryColor, secondaryColor: secondaryColor);
}

bool isToday(
  DateTime startDate,
  DateTime endDate,
) {
  DateTime now = DateTime.now();

  return (startDate.isBefore(now) && now.isBefore(endDate));
}

bool hasTaskWithTodayDate(List<TasksStruct> tasks) {
  DateTime now = DateTime.now();

  for (var task in tasks) {
    // Parse start and end dates and convert them to local time
    DateTime startDate = DateTime.parse(task.startDate).toLocal();
    DateTime endDate = DateTime.parse(task.endDate).toLocal();

    // Check if the current time is within the range and the status is "Pending"
    if (startDate.isBefore(now) &&
        now.isBefore(endDate) &&
        task.status == "pending") {
      return true;
    }
  }

  return false;
}

Color colorWithOpacity(
  Color color,
  double opacity,
) {
  return color.withOpacity(opacity);
}

bool isWithinMinutes(
  DateTime targetDateTime,
  String minutes,
  String waitTime,
) {
  DateTime now = DateTime.now();

  // Parse the grace time and wait time as integers
  int? parsedGraceTime = int.tryParse(minutes);
  int? parsedWaitTime = int.tryParse(waitTime);

  // If parsing fails, return false (disabling the button)
  if (parsedGraceTime == null || parsedWaitTime == null) {
    return false;
  }

  // Calculate the time before the meeting starts (grace period)
  DateTime gracePeriodStart =
      targetDateTime.subtract(Duration(minutes: parsedGraceTime));

  // Calculate the end of the wait period after the meeting starts
  DateTime waitPeriodEnd =
      targetDateTime.add(Duration(minutes: parsedWaitTime));

  // Enable the button if the current time is before the grace period or after the wait period
  if (now.isBefore(gracePeriodStart) || now.isAfter(waitPeriodEnd)) {
    return true; // Enable button for cancel/reschedule
  }

  return false; // Disable the button during the meeting and waiting period
}

String checkDateStatus(
  DateTime date,
  String status,
) {
  DateTime time = DateTime.now();
  if (date.isBefore(time) && status == 'pending') {
    return 'expired';
  } else if (date.isAtSameMomentAs(time) && status == 'pending') {
    return 'today';
  } else {
    return 'upcoming';
  }
  return '';
}

String getUri() {
  return Uri.base.origin;
}

int countTotalAnswers(List<QuestionnaireStruct> questions) {
  int totalAnswers = 0;

  for (var question in questions) {
    if (question.selectedIndex.isNotEmpty) {
      totalAnswers++;
    }
  }

  return totalAnswers;
}

List<OptionsStruct> convertToArrayofString(String input) {
  return [
    OptionsStruct(
      text: input, // Trim whitespace from the option text
    )
  ];
}

double calculateCompletionPercentage(
  DateTime startDate,
  DateTime endDate,
) {
  DateTime currentDate = DateTime.now();

  // Check if the end date is before the start date
  if (endDate.isBefore(startDate)) {
    throw ArgumentError("End date must be after start date.");
  }

  // If the current date is before the start date
  if (currentDate.isBefore(startDate)) {
    return 0.0;
  }

  // If the current date is after the end date
  if (currentDate.isAfter(endDate)) {
    return 1.0;
  }

  // Calculate total days between start and end
  int totalDays = endDate.difference(startDate).inDays;

  // Calculate days completed
  int daysCompleted = currentDate.difference(startDate).inDays;

  // Calculate the percentage completed
  double percentageCompleted = daysCompleted / totalDays;

  // Ensure the result is between 0.0 and 1.0
  return percentageCompleted.clamp(0.0, 1.0);
}

String removeSpaces(String input) {
  return input.replaceAll(' ', '');
}

int getTimerValue(DateTime startDate) {
  final currentTime = DateTime.now();
  final difference = startDate.difference(currentTime);

// Get the difference in milliseconds
  return difference.inMilliseconds;
}

List<SymptomsListStruct> createSelectedSymptomsList(
  List<SymptomsListStruct> symptomsList,
  String onSet,
  String severity,
  String duration,
) {
  return symptomsList.map((symptom) {
    // Create SelectedSymptomStruct for each symptom
    symptom.selectedValues = SelectedSymptomStruct(
      name: symptom.name,
      duration: duration,
      severity: severity,
      onSetDate: onSet,
    );
    return symptom;
  }).toList();
}

List<String> getItemByCategory(String category) {
  Map<String, List<String>> categoryMap = {
    'Lab Report': [
      'Complete Blood Count (CBC)',
      'Comprehensive Metabolic Panel (CMP)',
      'Blood Grouping',
      'Lipid Panel',
      'Thyroid Function Tests (TFTs)',
      'Urinalysis',
      'Hemoglobin A1c',
      'Liver Function Tests (LFTs)',
      'Coagulation Profile',
      'Kidney Function Tests',
      'Infectious Disease Tests (e.g., HIV, Hepatitis)',
      'Vitamin D Levels',
      'Blood Glucose Test',
      'OGTT/GTT (Oral Glucose tolerance test/Glucose tolerance test)',
      'Serum Ferritin',
      'Group B Streptococcus Screening',
      'NT Scan (Nuchal Translucency)',
      'Quadruple Marker Test',
      'Triple Marker Test',
      'Dual Marker Test',
      'PIGF Test (Placental Growth Factor Test)',
      'Amniocentesis Results',
      'Chromosomal Abnormality Tests',
      'Maternal Serum Screening',
      'Fetal Fibronectin Test',
      'Rh Antibody Screening',
      'Hemoglobin Electrophoresis',
      'Other',
    ],
    'Prescription': [
      'Antibiotics',
      'Antihypertensives',
      'Analgesics',
      'Antidepressants',
      'Anticoagulants',
      'Diabetes Medications (e.g., Metformin)',
      'Hormonal Treatments',
      'Vaccines',
      'Other Specific Treatments (e.g., chemotherapy agents)'
    ],
    'Insurance': [
      'Health Insurance Card',
      'Prescription Insurance Card',
      'Dental Insurance Card',
      'Vision Insurance Card',
      'Medicare Card',
      'Medicaid Card'
    ],
    'Scan': [
      'X-ray',
      'MRI (Magnetic Resonance Imaging)',
      'CT (Computed Tomography) Scan',
      'Ultrasound',
      'PET (Positron Emission Tomography) Scan',
      'Mammogram',
      'Echocardiogram',
      'DEXA Scan (Bone Density)',
      'Cardiotocography (CTG)',
      'Other',
    ],
    'Discharge Summary': [
      'General Discharge Summary',
      'Surgical Discharge Summary',
      'Emergency Room Discharge Summary',
      'Observation Unit Discharge Summary',
    ],
    'Vaccine Certificate': [
      'COVID-19 Vaccine Certificate',
      'Influenza Vaccine Certificate',
      'Hepatitis B Vaccine Certificate',
      'Measles, Mumps, and Rubella (MMR) Vaccine Certificate',
      'Tdap (Tetanus, Diphtheria, Pertussis) Vaccine Certificate',
      'Pneumococcal Vaccine Certificate',
    ],
    'Other': [
      'Referral Letters'
          'Medical History Documents',
      'Consent Forms',
      'Specialized Test Results (e.g., Genetic Testing)',
      'Health Records from Previous Providers',
    ],
  };

  // Return the list of items for the given category, or an empty list if the category is not found
  return categoryMap[category] ?? [];
}

String stringToImage(String? imageUrl) {
  return imageUrl == null ? "" : imageUrl;
}

List<dynamic> convertListToJson(List<VitalsStruct> vitals) {
  var value = vitals.map((vital) {
    return {
      'type': vital.type.toString().replaceAll(' ', ''),
      'value': vital.value,
      'note': vital.note,
      'date': "${vital.date}",
      'time': "${vital.time}",
      'entryType': "Manual"
    };
  }).toList();
  print(value.toString());
  return value;
}

ValidateResultStruct validateVitals(List<VitalsStruct> vitals) {
  final Set<String> types = {};
  for (final vital in vitals) {
    // Check if any vital's value is empty or null
    if (vital.value == null || vital.value.toString().isEmpty) {
      return ValidateResultStruct(
        isValid: false,
        errorMessage: "All vital values must be filled.",
      );
    }

    // Check for duplicate types
    if (types.contains(vital.type)) {
      return ValidateResultStruct(
        isValid: false,
        errorMessage: "Duplicate vital detected. Each vital must be unique.",
      );
    }

    types.add(vital.type);
  }

  return ValidateResultStruct(
    isValid: true,
    errorMessage: "",
  );
}

List<LineDataStruct> aggregationToLineData(
  List<AggregationStruct> aggregations,
  int filter,
) {
  print("Line Data = ${aggregations}");
  List<LineDataStruct> result = [];
  for (AggregationStruct aggregation in aggregations) {
    LineDataStruct lineData = LineDataStruct();
    var data;
    if (filter == 1) {
      data = aggregation.values.map((elem) {
        return elem.value;
      }).toList();
    } else {
      data = aggregation.value.map((elem) {
        return elem.median;
      }).toList();
    }
    lineData.data = data;
    result.add(lineData);
  }
  print(result);
  return result;
}

bool vitalsToShowcase(String vitalType) {
  List<String> vitals = [
    "BloodPressure",
    "HeartRate",
    "BodyTemperature",
    "SpO2",
    "Sleep",
    "RespirationRate",
    "FastingBloodGlucose",
    "RandomBloodGlucose",
    "AfterBreakfastBloodGlucose",
    "BeforeLunchBloodGlucose",
    "BeforeDinnerBloodGlucose",
    "AfterLunchBloodGlucose",
    "AfterDinnerBloodGlucose",
    "HbA1c",
    "StepCount",
    "Weight",
    "WaterIntake"
  ];
  return vitals.contains(vitalType);
}

List<String> returnFirstThree(List<String> months) {
  List<String> shortMonths = [];
  try {
    shortMonths = months.map((month) => month.substring(0, 3)).toList();

    print("months = ${shortMonths}");
    return shortMonths;
  } catch (e) {
    print("Error >> $e");
  }
  return shortMonths;
}

Color getColors(int index) {
  return Colors.primaries[index + 1];
}

double getMaximumValue(
  List<AggregationStruct>? maximums,
  int filter,
) {
  print("The max value is $maximums");

  if (maximums == null || maximums.isEmpty) {
    return 0; // Return 0 if the input is null or empty
  }

  double maxValue = 0;

  if (filter == 1) {
    for (var struct in maximums) {
      for (var value in struct.values) {
        if (value.value > maxValue) {
          maxValue = value.value;
        }
      }
    }
  } else {
    for (var struct in maximums) {
      for (var value in struct.value) {
        if (value.max > maxValue) {
          maxValue = value.max;
        }
      }
    }
  }
  print("The max value is $maxValue");

  return (maxValue + (maxValue * 0.3)).round().toDouble();
}

List<SymptomsListStruct> createSymptomsList(List<String> names) {
  return names.map((name) {
    // Create and return a SymptomsListStruct with the name
    return SymptomsListStruct(
      name: name, // Set the name field from the input string
      category:
          '', // You can set default or empty values for other fields if needed
      severityOptions: [],
      onsetOptions: [],
      selectedValues: SelectedSymptomStruct(),
    );
  }).toList();
}

dynamic convertSymptomsListToJson(
  List<SymptomsListStruct> symptomsList,
  List<SymptomsListStruct> onlySymtoms,
) {
  var mapList = symptomsList.map((symptom) {
    return {
      "name": symptom.selectedValues.name,
      "severity": symptom.selectedValues.severity,
      "duration": symptom.selectedValues.duration,
      "onSetDate": symptom.selectedValues.onSetDate
    };
  }).toList();

  // If onlySymptoms has elements, add them to the mapList in the same format
  if (onlySymtoms.isNotEmpty) {
    var additionalSymptoms = onlySymtoms.map((symptom) {
      return {
        "name": symptom.name,
        "severity": "",
        "duration": "",
        "onSetDate": ""
      };
    }).toList();

    // Add additional symptoms from onlySymptoms to the mapList
    mapList.addAll(additionalSymptoms);
  }

  print(mapList);
  return mapList;
}

List<String> dateStringToDateFormat(
  List<String> listOfDateString,
  List<String> listOfEndDateString,
) {
  List<String> result = [];
  try {
    for (String dateString in listOfDateString) {
      DateTime startDate = DateTime.parse(dateString);
      DateTime endDate = startDate.add(Duration(days: 6));

      String startDay = DateFormat("dd").format(startDate);
      String startMonth = DateFormat("MMM").format(startDate);
      String endDay = DateFormat("dd").format(endDate);
      String endMonth = DateFormat("MMM").format(endDate);
      String year = DateFormat("yy").format(startDate);

      String formattedRange;
      if (startMonth == endMonth) {
        formattedRange = "$startDay-$endDay $startMonth $year";
      } else {
        formattedRange = "$startDay-$endDay $endMonth $year";
      }

      result.add(formattedRange);
    }
  } catch (e) {
    print("Error >>>> $e");
  }
  print("Formatted Result = $result");
  return result;
}

DateTime convertMillisecondsToDateTime(String millisecondsString) {
  // Convert the milliseconds string to an integer
  int milliseconds = int.parse(millisecondsString);

  // Return the DateTime object based on the milliseconds
  return DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

List<SymptomsListStruct> mergeSymptomsList(
  List<SymptomsListStruct> existingSymptomsList,
  List<SymptomsListStruct> newSymptomsList,
) {
  Set<String> existingNames =
      existingSymptomsList.map((symptom) => symptom.name).toSet();

  // Combine the existing list with the new list while avoiding duplicates
  for (var newSymptom in newSymptomsList) {
    if (existingNames.contains(newSymptom.name)) {
      // If a symptom with the same name exists, update the existing symptom
      for (var existingSymptom in existingSymptomsList) {
        if (existingSymptom.name == newSymptom.name) {
          // Update the fields of the existing symptom with the new symptom values
          existingSymptom.category = newSymptom.category;
          existingSymptom.severityOptions = newSymptom.severityOptions;
          existingSymptom.onsetOptions = newSymptom.onsetOptions;
          existingSymptom.selectedValues = newSymptom.selectedValues;
          break; // Exit loop after updating
        }
      }
    } else {
      // If no duplicate, simply add the new symptom
      existingSymptomsList.add(newSymptom);
      existingNames.add(
          newSymptom.name); // Add name to the set to avoid future duplicates
    }
  }

  return existingSymptomsList;

  return existingSymptomsList;
}

List<SymptomsListStruct> createArrayofSymptom(SymptomsListStruct symptom) {
  return [symptom];
}

dynamic createtaskResponse(
  String? type,
  String? referenceId,
  String id,
) {
  return {
    "id": id,
    "status": "completed",
    "task_type": type ?? "",
    "taskRefId": referenceId ?? "",
  };
}

String? validateAdditionalFields(
  String? value,
  String fieldType,
) {
  if (value != null && value != "") {
    if (fieldType == 'Aadhaar' && value.length != 12) {
      return "Aadhaar number must be 12 digits long.";
    } else if (fieldType == 'ABHA' && value.length != 14) {
      return "ABHA number must be 14 digits long.";
    }
  }
  return "ok";
}

bool shouldDisplayVital(
  String vitalLabel,
  bool isFromResult,
) {
  const displayableVitals = [
    'Waist Circumference',
    'Hip Circumference',
    'Height',
    'Weight',
    'BMI',
    'Waist to Hip Ratio',
    'Body Temperature',
    'Heart Rate',
    'Blood Pressure',
    'Water Intake',
    'Step Count',
    'Sleep',
    'Fasting Blood Glucose',
    'Random Blood Glucose',
    'After Breakfast Blood Glucose',
    'Before Lunch Blood Glucose',
    'Before Dinner Blood Glucose',
    'After Lunch Blood Glucose',
    'After Dinner Blood Glucose',
    'HbA1c',
    'Baby Kick Count'
  ];

  const displayableVitalsResult = ['BMI', 'Heart Rate', 'Blood Pressure'];

  if (isFromResult) {
    return displayableVitalsResult.contains(vitalLabel);
  }
  return displayableVitals.contains(vitalLabel);
}

List<ItemsStruct> combineEducationItems(EducationModelStruct category) {
  List<ItemsStruct> allItems = [];

  // Loop through each EducationStruct (category) and combine their items if available
  for (var cat in category.education) {
    // Extract items from each category if they exist
    var items = cat.items; // items is a list of ItemsStruct
    if (items.isNotEmpty) {
      allItems.addAll(items); // Add all items from this category
    }
  }

  return allItems;
}

dynamic convertProfileToJson(
  ProfileModelStruct profile,
  DateTime dob,
) {
  Map<String, dynamic> jsonObject = {};

  jsonObject['firstName'] = profile.firstName;
  jsonObject['lastName'] = profile.lastName;
  jsonObject['gender'] = profile.gender;
  jsonObject['email'] = profile.email;
  jsonObject['dob'] = dob.millisecondsSinceEpoch;
  jsonObject['phoneNumber'] = profile.phoneNumber;
  jsonObject['aadhaarId'] = profile.aadhaarId;
  jsonObject['abhaId'] = profile.abhaId;
  jsonObject['bloodGroup'] = profile.bloodGroup;
  jsonObject['height'] = profile.height;
  jsonObject['weight'] = profile.weight;

  print("------1");
  // Check if emergencyContacts is null or empty and assign an empty array if true
  jsonObject['emergencyContacts'] =
      (profile.emergencyContacts == null || profile.emergencyContacts.isEmpty)
          ? []
          : profile.emergencyContacts
              .where((e) => e.name != null && e.name.trim().isNotEmpty)
              .map((e) => {
                    'name': e.name,
                    'relation': e.relation,
                    'phone': e.phone,
                  })
              .toList();

  print(jsonObject);

  return jsonObject;
}

List<InstructionsStruct> getRecommendations(
  String category,
  String severity,
) {
  final data = [
    {
      "category": "Body Temperature",
      "severity": "high",
      "instructions": [
        {
          "title": "Check Again Soon",
          "content":
              "Recheck your level in 30 minutes to see if it has improved."
        },
        {
          "title": "Immediate Actions",
          "content":
              "For immediate relief you can use a cool, damp cloth on your forehead and recommend talking to your doctor before taking any medication."
        }
      ]
    },
    {
      "category": "Body Temperature",
      "severity": "low",
      "instructions": [
        {
          "title": "Connect with your doctor",
          "content": "We recommend getting in touch with your doctor."
        },
        {
          "title": "Immediate Actions",
          "content":
              "For immediate actions please consider moving to a warmer place and slowly warming yourself with blankets along with using warm, dry compresses on neck, chest and groin."
        }
      ]
    },
    {
      "category": "Blood Pressure",
      "severity": "low",
      "instructions": [
        {
          "title": "Check Again Soon",
          "content":
              "Make sure you're feeling well and take the measurement again in 30 minutes."
        },
        {
          "title": "Immediate Actions",
          "content":
              "In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you. If you still don't feel good then contact your doctor or visit the nearest emergency/casualty centre if required."
        }
      ]
    },
    {
      "category": "Blood Pressure",
      "severity": "high",
      "instructions": [
        {
          "title": "Check Again Soon",
          "content": "Wait 5 minutes and take another reading."
        },
        {
          "title": "Immediate Actions",
          "content":
              "In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you. If you still don't feel good then contact your doctor or visit the nearest emergency/casualty centre if required."
        }
      ]
    },
    {
      "category": "Blood Pressure",
      "severity": "above normal",
      "instructions": [
        {
          "title": "Replenish",
          "content": "However, this is not a cause for concern"
        },
        {
          "title": "Immediate Actions",
          "content":
              "Wait 5 minutes and take another reading. If it is still high then get in touch with your doctor."
        }
      ]
    },
    {
      "category": "Fasting Blood Glucose",
      "severity": "low",
      "instructions": [
        {
          "title": "Immediate Actions",
          "content":
              "Have 15 grams of carbs (½ cup of juice or 1 tablespoon of sugar, honey or Hard candies or 3-4 glucose tablets)"
        },
        {
          "title": "Recheck",
          "content": "Check your blood glucose levels again in 15 minutes."
        },
        {
          "title": "Check your range",
          "content":
              "If it’s still below your target range, have another serving. Repeat these steps until it’s in your target range (70-99 mg/dL)"
        },
        {
          "title": "Replenish",
          "content":
              "Once it’s in range, eat a nutritious meal or snack to ensure it doesn’t get too low again."
        },
        {
          "title": "Connect with your doctor",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "Fasting Blood Glucose",
      "severity": "high",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "Before Lunch Blood Glucose",
      "severity": "low",
      "instructions": [
        {
          "title": "Immediate Actions",
          "content":
              "Have 15 grams of carbs (½ cup of juice or 1 tablespoon of sugar, honey or Hard candies or 3-4 glucose tablets)"
        },
        {
          "title": "Recheck",
          "content": "Check your blood glucose levels again in 15 minutes."
        },
        {
          "title": "Check your range",
          "content":
              "If it’s still below your target range, have another serving. Repeat these steps until it’s in your target range (70-99 mg/dL)"
        },
        {
          "title": "Replenish",
          "content":
              "Once it’s in range, eat a nutritious meal or snack to ensure it doesn’t get too low again."
        },
        {
          "title": "Connect with your doctor",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "Before Lunch Blood Glucose",
      "severity": "high",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "Before Dinner Blood Glucose",
      "severity": "low",
      "instructions": [
        {
          "title": "Immediate Actions",
          "content":
              "Have 15 grams of carbs (½ cup of juice or 1 tablespoon of sugar, honey or Hard candies or 3-4 glucose tablets)"
        },
        {
          "title": "Recheck",
          "content": "Check your blood glucose levels again in 15 minutes."
        },
        {
          "title": "Check your range",
          "content":
              "If it’s still below your target range, have another serving. Repeat these steps until it’s in your target range (70-99 mg/dL)"
        },
        {
          "title": "Replenish",
          "content":
              "Once it’s in range, eat a nutritious meal or snack to ensure it doesn’t get too low again."
        },
        {
          "title": "Connect with your doctor",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "Before Dinner Blood Glucose",
      "severity": "high",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "After Breakfast Blood Glucose",
      "severity": "low",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "After Breakfast Blood Glucose",
      "severity": "high",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "After Lunch Blood Glucose",
      "severity": "low",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "After Lunch Blood Glucose",
      "severity": "high",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "After Dinner Blood Glucose",
      "severity": "low",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "After Dinner Blood Glucose",
      "severity": "high",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "Random Blood Glucose",
      "severity": "low",
      "instructions": [
        {
          "title": "Immediate Actions",
          "content":
              "Have 15 grams of carbs (½ cup of juice or 1 tablespoon of sugar, honey or Hard candies or 3-4 glucose tablets)"
        },
        {
          "title": "Recheck",
          "content": "Check your blood glucose levels again in 15 minutes."
        },
        {
          "title": "Check your range",
          "content":
              "If it’s still below your target range, have another serving. Repeat these steps until it’s in your target range (70-99 mg/dL)"
        },
        {
          "title": "Replenish",
          "content":
              "Once it’s in range, eat a nutritious meal or snack to ensure it doesn’t get too low again."
        },
        {
          "title": "Connect with your doctor",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "Random Blood Glucose",
      "severity": "high",
      "instructions": [
        {
          "title": "Immediate actions",
          "content":
              "Make sure to discuss your measurements with your doctor at your clinic visit. In the meantime we'd like to know if you've been experiencing any symptoms. Please answer the Symptom Checker assigned to you and visit your nearest emergency/casualty centre if you feel any discomfort."
        }
      ]
    },
    {
      "category": "HbA1c",
      "severity": "pre-diabetic",
      "instructions": [
        {
          "title": "Check Again Soon",
          "content":
              "Check your blood sugar with a glucometer, particularly after meals to keep a track of your blood sugar."
        },
        {
          "title": "Recommendations",
          "content":
              "We recommend visiting a doctor to discuss your results for further treatment plans."
        }
      ]
    },
    {
      "category": "HbA1c",
      "severity": "diabetic",
      "instructions": [
        {
          "title": "Check Again Soon",
          "content":
              "Check your blood sugar with a glucometer, particularly after meals to keep a track of your blood sugar."
        },
        {
          "title": "Immediate Actions",
          "content":
              "We recommend visiting a doctor to discuss your results and possible medication or new treatment options."
        }
      ]
    }
  ];

  /// Filtering data
  final matchingData = data.firstWhere(
    (entry) => entry['category'] == category && entry['severity'] == severity,
    orElse: () => {"instructions": []}, // Default value for orElse
  );

  final instructions = matchingData['instructions'] as List;

  return instructions
      .map((instruction) => InstructionsStruct(
            title: instruction['title'],
            content: instruction['content'],
          ))
      .toList();
}

bool isNotFutureDate(DateTime dateTime) {
  final currentDateTime = DateTime.now();
  return dateTime.isBefore(currentDateTime) ||
      dateTime.isAtSameMomentAs(currentDateTime);
}

dynamic createJsonForQuestionarrie(List<QuestionnaireStruct> questions) {
  List<Map<String, dynamic>> jsonArray = [];

  for (var question in questions) {
    List<String> selectedOption = [];

    if (question.selectedIndex != null && question.selectedIndex!.isNotEmpty) {
      // Map indices to corresponding scores
      selectedOption = question.selectedIndex!
          .map((index) => question.options[index].option)
          .toList();
    }

    // Add question and answer to the JSON array
    jsonArray.add({
      'number': question.number,
      'answer': {
        'selectedOptions': selectedOption, // Use scores as selectedOptions
        'otherText': question.otherText != null
            ? question.otherText
            : '', // Placeholder for additional text
      },
    });
  }

  return jsonArray;
}

bool isStringInList(
  QuestionnaireStruct option,
  String newEntry,
) {
  List<String> staticList = ['None of the above', 'None'];

  List<String> selectedOptions =
      option.selectedIndex.map((index) => option.options[index].text).toList();

  // Check if the input exists in the hardcoded list
  return selectedOptions.any(staticList.contains) ||
      staticList.contains(newEntry);
}

RecommendationColorsStruct getColorsBasedOnRecommendationType(
    String recommendationType) {
  switch (recommendationType?.toLowerCase()) {
    case 'dietary habits':
    case 'not defined by diabetes!':
    case 'your health!':
      return RecommendationColorsStruct(
          primary: Color(0xff40664D), secondary: Color(0xffEFFF42));
    case 'exercise habits':
      return RecommendationColorsStruct(
          primary: Color(0xff065999), secondary: Color(0xff5AFCEB));
    case 'sleep hygiene':
      return RecommendationColorsStruct(
          primary: Color(0xff6C4B8C), secondary: Color(0xff6AFFAF));
    case 'mental health':
      return RecommendationColorsStruct(
          primary: Color(0xff783527), secondary: Color(0xffFFE2E0));
    case 'lifestyle habits':
    case 'smoking':
    case 'are smoke-free!':
      return RecommendationColorsStruct(
          primary: Color(0xffB73859), secondary: Color(0xffEEEEEE));
    case 'medication adherence':
      return RecommendationColorsStruct(
          primary: Color(0xff2D755F), secondary: Color(0xffB7FF74));
    case 'hdl cholesterol':
    case 'hdl cholesterol is low!':
    case 'hdl cholesterol is at an optimal level!':
      return RecommendationColorsStruct(
          primary: Color(0xff40664D), secondary: Color(0xffEFFF42));
    case 'total cholesterol':
    case 'total cholesterol is high!':
    case 'total cholesterol levels are optimal!':
      return RecommendationColorsStruct(
          primary: Color(0xff065999), secondary: Color(0xff5AFCEB));
    case 'systolic blood pressure':
    case 'systolic blood pressure is elevated/high!':
    case 'systolic blood pressure is optimal!':
      return RecommendationColorsStruct(
          primary: Color(0xff6C4B8C), secondary: Color(0xff6AFFAF));
    case 'diastolic blood pressure':
      return RecommendationColorsStruct(
          primary: Color(0xff783527), secondary: Color(0xffFFE2E0));
    case 'diabetes history':
      return RecommendationColorsStruct(
          primary: Color(0xff2D755F), secondary: Color(0xffB7FF74));
    default:
      return RecommendationColorsStruct(
          primary: Color(0xff40664D), secondary: Color(0xffEFFF42));
  }
}

List<String> dateStringToDaysDateFormat(List<String> listOfDateString) {
  print("Date String Input = ${listOfDateString}");

  // Define the desired output format
  final DateFormat formatter = DateFormat("dd MMM yy");
  List<String> result = [];
  try {
    final DateFormat formatter = DateFormat("dd MMM yy");
    result = listOfDateString.map((dateString) {
      DateTime date = DateTime.parse(dateString);
      return formatter.format(date);
    }).toList();
    print("Formatted Dates = $result");
    return result;
  } catch (e) {
    print("Error >>> $e");
  }
  return result;
}

List<String> dateStringToTimeFormat(List<String> listOfDateString) {
  print("dateString To Time Format = ${listOfDateString}");
  List<String> result = [];
  try {
    result = listOfDateString.map((dateString) {
      DateTime date = DateTime.parse(dateString).toUtc();
      DateTime local = date.toLocal();
      double totalMinutes = (local.hour * 60 + local.minute) / 60;

      if (totalMinutes == totalMinutes.toInt().toDouble()) {
        // If it's a whole number, return with one decimal place (e.g., 10.0)
        return totalMinutes.toStringAsFixed(1);
      } else {
        // Otherwise, return with two decimal places
        return totalMinutes
            .toStringAsFixed(2)
            .replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), "");
      }
    }).toList();
    print("Result final: $result");
    return result;
  } catch (e) {
    print("Error >>>> $e");
  }

  return [];
}

double? getMinimumValue(
  List<AggregationStruct>? minimum,
  int? filter,
) {
  print("The min value is $minimum");

  if (minimum == null || minimum.isEmpty) {
    return 0; // Return 0 if the input is null or empty
  }

  double minValue = double.infinity; // Start with the highest possible value.

  if (filter == 1) {
    for (var struct in minimum) {
      for (var value in struct.values) {
        if (value.value != 0 && value.value < minValue) {
          minValue = value.value; // Update minValue only if value is not 0
        }
      }
    }
  } else {
    for (var struct in minimum) {
      for (var value in struct.value) {
        if (value.min != 0 && value.min < minValue) {
          minValue = value.min; // Update minValue only if value is not 0
        }
      }
    }
  }

  // If minValue remains infinity, it means no valid (non-zero) values were found
  if (minValue == double.infinity) {
    minValue = 0;
  }

  print("The min value is $minValue");

  return (minValue - (minValue * 0.3)).round().toDouble();
}

List<dynamic> convertExercisetoJson(List<ExerciseDataStruct> exercises) {
  var value = exercises.map((exercise) {
    return {
      'exerciseType': exercise.exerciseType,
      'time': exercise.time,
      'duration': exercise.duration,
    };
  }).toList();
  return value;
}

List<dynamic> convertFoodtoJson(List<MealStruct> meals) {
  var value = meals.map((meal) {
    return {
      'mealType': meal.mealType,
      'mealTime': meal.mealTime,
      'items': meal.items
          .map((item) => {
                'foodItem': item.foodItem,
                'portion': item.portion,
                'portionSize': item.portionSize,
              })
          .toList(),
    };
  }).toList();
  return value;
}

bool isTodayDate(DateTime? dateTime) {
  if (dateTime == null) {
    return false;
  }

  final now = DateTime.now();
  return dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day;
}

DateTime previousMorningDate(DateTime date) {
  DateTime start = DateTime(date.year, date.month, date.day, 0, 0, 0);
  return start;
}

bool isOtherSelected(QuestionnaireStruct option) {
  List<String> staticList = ['Other'];

  List<String> selectedOptions =
      option.selectedIndex.map((index) => option.options[index].text).toList();

  // Check if the input exists in the hardcoded list
  return selectedOptions.any(staticList.contains);
}

dynamic vitalsConfig() {
  final vitalsConstants = {
    "HeartRate": {
      "unit": "BPM",
      "label": "Heart Rate",
      "description":
          "Heart rate is a measure of the number of times the heart beats per minute (bpm). It is an important indicator of the body's cardiovascular health and can provide insight into various physiological and medical conditions.",
      "rangeType": "posture",
      "graph": "line",
      "allowEscalation": false,
      "ranges": {
        "resting": [
          {
            "point": 30,
            "start": 0,
            "end": 59,
            "label": "Low",
            "color": "#FAC02B",
            "desc": "A low resting heart rate range is 30 to 59 bpm."
          },
          {
            "point": 60,
            "start": 60,
            "end": 100,
            "label": "Normal",
            "color": "#64BD40",
            "desc": "A Normal resting heart rate range is 60 to 100 bpm."
          },
          {
            "point": 101,
            "start": 101,
            "end": 220,
            "label": "High",
            "color": "#DD3923",
            "desc": "A high resting heart rate range is 100 to 139 bpm."
          },
          {
            "point": 220,
            "start": 220,
            "end": 230,
            "label": "High",
            "color": "#DD3923",
            "desc": "A high resting heart rate range is 100 to 139 bpm."
          }
        ],
        "standing": [
          {
            "point": 40,
            "start": 0,
            "end": 59,
            "label": "Low",
            "color": "#FAC02B",
            "desc": "A low standing heart rate range is 30 to 59 bpm."
          },
          {
            "point": 60,
            "start": 60,
            "end": 100,
            "label": "Normal",
            "color": "#64BD40",
            "desc": "Normal standing heart rate range is 60 to 100 bpm."
          },
          {
            "point": 101,
            "start": 101,
            "end": 139,
            "label": "High",
            "color": "#DD3923",
            "desc": "A high-standing heart rate is 100 to 139 bpm."
          }
        ],
        "walking": [
          {
            "point": 30,
            "start": 0,
            "end": 99,
            "label": "Low",
            "color": "#FAC02B",
            "desc": "A low walking heart rate range is 70 to 99 bpm."
          },
          {
            "point": 91,
            "start": 100,
            "end": 120,
            "label": "Normal",
            "color": "#64BD40",
            "desc": "Normal walking heart rate range is 100 to 120 bpm."
          },
          {
            "point": 121,
            "start": 121,
            "end": 220,
            "label": "High",
            "color": "#DD3923",
            "desc": "A high walking heart rate range is 121 to 149 bpm."
          }
        ],
        "exercising": [
          {
            "point": 30,
            "start": 0,
            "end": 119,
            "label": "Low",
            "color": "#FAC02B",
            "desc": "A Low exercising heart rate range is 100 to 119 bpm."
          },
          {
            "point": 120,
            "start": 120,
            "end": 150,
            "label": "Normal",
            "color": "#64BD40",
            "desc": "A Normal exercising heart rate range is 120 to 150 bpm."
          },
          {
            "point": 151,
            "start": 151,
            "end": 220,
            "label": "High",
            "color": "#DD3923",
            "desc": "A High exercising heart rate range is 150 to 189 bpm."
          }
        ]
      }
    },
    "RespirationRate": {
      "unit": "breaths/min",
      "label": "Respiration Rate",
      "graph": "line",
      "description":
          "Respiration rate is the number of breaths a person takes in a minute. It is a measure of the rate of breathing, which is an indicator of the oxygen and carbon dioxide exchange that is taking place in the body. Your respiratory rate is also known as your breathing rate.",
      "allowEscalation": false,
      "ranges": [
        {
          "start": 0,
          "end": 12,
          "label": "Low",
          "color": "#FAC02B",
          "desc": "A Low respiration rate range is below 12 bpm."
        },
        {
          "start": 12,
          "end": 21,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A Normal respiration heart rate range is 12 to 20 bpm."
        },
        {
          "start": 21,
          "end": 30,
          "label": "High",
          "color": "#DD3923",
          "desc": "A High respiration heart rate range is 21 to 30 bpm."
        }
      ]
    },
    "SpO2": {
      "unit": "%",
      "label": "SpO2",
      "graph": "line",
      "description":
          "Oxygen , also known as SpO₂ is an important measurement used to assess the amount of oxygen being carried by the blood and delivered to the body's tissues.",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 80,
          "start": 0,
          "end": 80,
          "label": "Low",
          "color": "#DD3923",
          "desc":
              "Oxygen  below 90% is very concerning and indicates an emergency.\n\nLow oxygen saturation range is 86 to 90%"
        },
        {
          "point": 91,
          "start": 81,
          "end": 91,
          "label": "Concerning",
          "color": "#FAC02B",
          "desc":
              "Oxygen concentrations between 91% and 94% may indicate a medical problem. You should contact your healthcare provider."
        },
        {
          "point": 95,
          "start": 92,
          "end": 95,
          "label": "Normal",
          "color": "#64BD40",
          "desc":
              "Measures how much oxygen the red blood cells are carrying from the lungs to the rest of the body. This is the number of breaths you take per minute.\n\nNormal oxygen saturation range is 95 to 100%"
        },
        {
          "point": 100,
          "start": 96,
          "end": 100,
          "label": "Normal",
          "color": "#64BD40",
          "desc":
              "Measures how much oxygen the red blood cells are carrying from the lungs to the rest of the body. This is the number of breaths you take per minute.\n\nNormal oxygen saturation range is 95 to 100%"
        }
      ]
    },
    "BloodPressure": {
      "unit": "mmHg",
      "label": "Blood Pressure",
      "multiValue": true,
      "graph": "line",
      "multiVitals": true,
      "subVitals": ["bp_sys", "bp_dia"],
      "description":
          "Blood pressure is the pressure of circulating blood against the walls of blood vessels. The pressure of blood is exerted on the walls of the arteries, which carry blood from the heart to other parts of the body.",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "Above Normal", "High"],
      "symptomTracker": true,
      "ranges": {
        "bp_sys": [
          {
            "point": 50,
            "start": 0,
            "end": 100,
            "label": "Low",
            "color": "#FAC02B",
            "desc": "Systolic pressure"
          },
          {
            "point": 100,
            "start": 100,
            "end": 121,
            "label": "Normal",
            "color": "#64BD40",
            "desc": "Normal systolic pressure is from 101 to 120 mmHg."
          },
          {
            "point": 120,
            "start": 121,
            "end": 140,
            "label": "Above Normal",
            "color": "#F18233",
            "desc": "Above Normal systolic pressure is from 121 to 139 mmHg."
          },
          {
            "point": 139,
            "start": 140,
            "end": 220,
            "label": "High",
            "color": "#DD3923",
            "desc":
                "High blood pressure is often related to unhealthy lifestyle habits.\nHigh systolic pressure is above 140 mmHg."
          }
        ],
        "bp_dia": [
          {
            "point": 30,
            "start": 0,
            "end": 70,
            "label": "Low",
            "color": "#FAC02B"
          },
          {
            "point": 70,
            "start": 70,
            "end": 81,
            "label": "Normal",
            "color": "#64BD40"
          },
          {
            "point": 80,
            "start": 81,
            "end": 90,
            "label": "Above Normal",
            "color": "#F18233"
          },
          {
            "point": 90,
            "start": 90,
            "end": 120,
            "label": "High",
            "color": "#DD3923"
          }
        ]
      }
    },
    "HrvSdnn": {
      "unit": "ms",
      "label": "SDNN",
      "description":
          "Heart rate variability (HRV) is a measure of the variation in time between successive heartbeats. It is the fluctuation in the time intervals between adjacent heartbeats.\n\nSDNN (Standard Deviation of NN Intervals) is a measure of heart rate variability (HRV). It's a commonly used index that provides an estimate of the average variation in time between successive heartbeats (also known as NN intervals or R-R intervals).",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 0,
          "label": "Low",
          "start": 0,
          "end": 29,
          "color": "#FAC02B",
          "desc": "A low SDNN range is from 1 to 29 ms."
        },
        {
          "point": 30,
          "start": 30,
          "end": 96,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A normal SDNN range is from 30 to 96 ms."
        },
        {
          "point": 97,
          "start": 97,
          "end": 150,
          "label": "High",
          "color": "#1A5701",
          "desc": "A High SDNN range is above 97ms."
        }
      ]
    },
    "HrvRmssd": {
      "unit": "ms",
      "label": "RMSSD",
      "description":
          "Heart rate variability (HRV) is a measure of the variation in time between successive heartbeats. It is the fluctuation in the time intervals between adjacent heartbeats.\n\nRMSSD (Root Mean Square of Successive Differences) is another measure of heart rate variability (HRV). RMSSD provides an estimate of the variability in time between successive heartbeats (also known as NN intervals or R-R intervals).",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 0,
          "start": 0,
          "end": 19,
          "label": "Low",
          "color": "#FAC02B",
          "desc": "A low RMSSD range is from 1 to 19 ms."
        },
        {
          "point": 20,
          "start": 20,
          "end": 89,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A normal RMSSD range is from 20 to 89 ms."
        },
        {
          "point": 90,
          "start": 90,
          "end": 150,
          "label": "High",
          "color": "#1A5701",
          "desc": "A high RMSSD range is above 90ms."
        }
      ]
    },
    "HrvPnn50": {
      "unit": "%",
      "label": "PNN50",
      "description":
          "Heart rate variability (HRV) is a measure of the variation in time between successive heartbeats. It is the fluctuation in the time intervals between adjacent heartbeats.\n\nPNN50 is a measure of the number of short-term fluctuations in the heart rate and is considered to reflect changes in HRV primarily driven by the sympathetic branch of the autonomic nervous system, which prepares the body for stress and physical activity. HRV is the physiological phenomenon of variation, it is measured by the variation in the beat-to-beat interval.",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 0,
          "start": 0,
          "end": 5,
          "label": "Low",
          "color": "#FAC02B",
          "desc": "A low PNN50 range is from 1 to 4%"
        },
        {
          "point": 5,
          "start": 5,
          "end": 41,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A normal PNN50 range is from 5 to 40%"
        },
        {
          "point": 41,
          "start": 41,
          "end": 90,
          "label": "High",
          "color": "#1A5701",
          "desc": "A high PNN50 range is above 41%"
        }
      ]
    },
    "CardiacOutput": {
      "unit": "L/min",
      "label": "Cardiac Output",
      "description":
          "Cardiac output is the amount of blood that the heart pumps out per minute. It is a crucial measure of heart function and is considered an important indicator of overall cardiovascular health.",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 1,
          "start": 1,
          "end": 4,
          "label": "Low",
          "color": "#FAC02B",
          "desc": "A low cardiac output range is from 2 to 3 L/min"
        },
        {
          "point": 4,
          "start": 4,
          "end": 8,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A normal cardiac output range is from 4 to 6 L/min"
        },
        {
          "point": 8,
          "start": 8,
          "end": 10,
          "label": "High",
          "color": "#DD3923",
          "desc": "A high cardiac output range is from 8 L/min"
        }
      ]
    },
    "MeanArterialPressure": {
      "unit": "mmHg",
      "label": "Mean Arterial Pressure",
      "description":
          "Mean arterial pressure (MAP) is a measure of the average blood pressure in the arteries over one cardiac cycle, which is important for maintaining the proper flow of blood and oxygen to the body's tissues.",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 1,
          "start": 1,
          "end": 60,
          "label": "Low",
          "color": "#FAC02B",
          "desc": "A low MAP range is less than 60 mmHg."
        },
        {
          "point": 70,
          "start": 61,
          "end": 100,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A normal MAP range is less than 70 to 100 mmHg."
        },
        {
          "point": 101,
          "start": 101,
          "end": 120,
          "label": "High",
          "color": "#DD3923",
          "desc": "A high MAP range is above 100 mmHg."
        }
      ]
    },
    "Heart Utilized": {
      "unit": "%",
      "description":
          "A healthy heart contracts (empties blood) and relaxes (refills blood). With each heartbeat, the heart pumps blood from the left and right ventricles.",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 20,
          "label": "Low",
          "color": "#FAC02B",
          "desc": "A low heart utilization is less than 40%"
        },
        {
          "point": 41,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A normal heart utilization is from 41 to 70%"
        },
        {
          "point": 71,
          "label": "High",
          "color": "#DD3923",
          "desc": "A high heart utilization is above 75%"
        },
        {
          "point": 100,
          "label": "High",
          "color": "#DD3923",
          "desc": "A high heart utilization is above 75%"
        }
      ]
    },
    "Heart Rate Max": {
      "unit": "BPM",
      "allowEscalation": false,
      "description":
          "Your heart rate max is the number of beats per minute your heart can reach during exercise. It is possible to exceed the upper limit of your zone without any ill effects, as long as you do not have coronary artery disease or are at risk for a heart attack."
    },
    "Heart Rate Reserve": {
      "unit": "BPM",
      "allowEscalation": false,
      "description":
          "Heart rate reserve is the difference between your maximum (peak) heart rate and your resting heart rate."
    },
    "Target HR Range": {
      "unit": "BPM",
      "allowEscalation": false,
      "description":
          "Your target heart rate is a range of numbers that reflect how fast your heart should be beating when you exercise."
    },
    "VO2Max": {
      "label": "VO₂ Max",
      "unit": "mL/kg/min",
      "allowEscalation": false,
      "description":
          "VO₂ max refers to how much oxygen your body can absorb and use during exercise."
    },
    "Height": {
      "unit": "cms",
      "label": "Height",
      "allowEscalation": false,
      "description":
          "Height is used alongside weight to assess growth, calculate BMI, and evaluate overall health."
    },
    "BMI": {
      "unit": "kg/m²",
      "label": "BMI",
      "description":
          "Body Mass Index (BMI) is a measurement based on your weight and height. It is more of an indicator than a direct measurement of your total body fat.",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 0,
          "start": 0,
          "end": 18.4,
          "label": "Low",
          "color": "#FAC02B",
          "desc": "A low BMI is from 0 to 18.4 kg/m²"
        },
        {
          "point": 18.4,
          "start": 18.5,
          "end": 24.9,
          "label": "Normal",
          "color": "#64BD40",
          "desc": "A normal BMI is from 18.5 to 24.9 kg/m²"
        },
        {
          "point": 24.9,
          "start": 25,
          "end": 29.9,
          "label": "High",
          "color": "#F18233",
          "desc": "A high BMI is from 25 to 29.9 kg/m²"
        },
        {
          "point": 29.9,
          "start": 30,
          "end": 40,
          "label": "Obese",
          "color": "#DD3923",
          "desc": "A very high BMI is above 30 kg/m²"
        }
      ]
    },
    "BloodVolume": {
      "unit": "ml",
      "label": "Blood Volume",
      "allowEscalation": false,
      "description":
          "Blood volume refers to the total amount of fluid circulating within the arteries, capillaries, veins, venules, and chambers of the heart at any time."
    },
    "TotalBodyWater": {
      "unit": "liters",
      "label": "Total Body Water",
      "allowEscalation": false,
      "description":
          "Total Body Water is the total amount of water in the human body. This includes fluids both inside and outside of cells."
    },
    "BodyWater": {
      "unit": "%",
      "label": "Body Water",
      "allowEscalation": false,
      "description":
          "Most of the human body is water, with an average of roughly 60%. The amount of water in the body changes slightly with age, sex, and hydration levels."
    },
    "TotalBodyFat": {
      "unit": "%",
      "label": "Total Body Fat",
      "allowEscalation": false,
      "description":
          "Body fat percentage is an indicator of your body composition and indicates the amount of fat you have in your body"
    },
    "Weight": {
      "unit": "kg",
      "label": "Weight",
      "allowEscalation": false,
      "description":
          "Weight is a measure of your body's mass and an important indicator of health.",
      "graph": "line"
    },
    "Calorie from Carb": {
      "unit": "%",
      "allowEscalation": false,
      "description":
          "Calories from carbohydrates describe the amount of energy that is derived from the consumption of carbohydrates in a person's diet. Carbohydrates are a macronutrient that are an important source of energy for the body, along with proteins and fats."
    },
    "Calorie from Fat": {
      "unit": "%",
      "allowEscalation": false,
      "description":
          "A calorie from fat is a unit of measurement of the energy obtained from consuming fats. It is a type of calorie that is derived from the macronutrient fat."
    },
    "StressIndex": {
      "label": "Stress Index",
      "unit": "SI",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 0,
          "start": 0,
          "end": 0.5,
          "label": "Low",
          "color": "#1A5701"
        },
        {
          "point": 0.5,
          "start": 0.5,
          "end": 1.5,
          "label": "Normal",
          "color": "#64BD40"
        },
        {
          "point": 1.5,
          "start": 1.5,
          "end": 5,
          "label": "Elevated",
          "color": "#FAC02B"
        },
        {"point": 5, "start": 6, "end": 10, "label": "High", "color": "#DD3923"}
      ],
      "description":
          "The body's reaction to a challenge or demand. There are 5 levels of stress."
    },
    "WellbeingScore": {
      "label": "Wellbeing Score",
      "unit": "",
      "description":
          "After a scan is completed successfully,  the app analyses the vitals data and returns a result of Low, Normal, or High for each parameter. our app generates the risk score based on the results.",
      "allowEscalation": false,
      "ranges": [
        {
          "point": 0,
          "start": 0,
          "end": 25,
          "label": "Poor",
          "color": "#DD3923",
          "info":
              "Your body vitals are in the poor range. We suggest you consult with a healthcare provider right away to get a diagnosis and treatment plan."
        },
        {
          "point": 25,
          "start": 26,
          "end": 50,
          "label": "Moderate",
          "color": "#FAC02B",
          "info":
              "Your body vitals are in the moderate range, which means there is some room for improvement. You may need to make some lifestyle changes or consult with a healthcare provider to address any issues. But don't worry, with the right actions, you can boost your wellbeing and feel better."
        },
        {
          "point": 50,
          "start": 51,
          "end": 75,
          "label": "Good",
          "color": "#64BD40",
          "info":
              "Your body vitals are good, which means you're doing a lot of things right. You may have a few areas where you could improve, but overall you're in good shape. Keep monitoring your vitals and making healthy choices to maintain this level of wellbeing."
        },
        {
          "point": 75,
          "start": 76,
          "end": 100,
          "label": "Excellent",
          "color": "#1A5701",
          "info":
              "Congratulations, your body vitals are excellent! Your heart is beating strong, your blood pressure is steady, your oxygen level is optimal, and your breathing is easy. Keep up the good work and enjoy feeling your best."
        }
      ]
    },
    "WaistCircumference": {
      "unit": "cm",
      "label": "Waist Circumference",
      "allowEscalation": false,
      "description":
          "Waist circumference is the measurement around your belly, helping to assess body fat distribution and health risks. It's an important metric for understanding your risk of conditions like heart disease and diabetes.",
      "graph": "line"
    },
    "HipCircumference": {
      "unit": "cm",
      "label": "Hip Circumference",
      "allowEscalation": false,
      "description":
          "Hip circumference measures the distance around the widest part of your hips and is used to assess body fat distribution. It helps in determining health risks and is often used alongside waist circumference to calculate the waist-to-hip ratio.",
      "graph": "line"
    },
    "WaistToHipRatio": {
      "unit": "",
      "label": "Waist to Hip ratio",
      "allowEscalation": false,
      "description":
          "The waist-to-hip ratio is a comparison of the size of your waist to your hips, used to assess body fat distribution. It is calculated from your waist and hip circumference."
    },
    "BodyTemperature": {
      "unit": "°F",
      "label": "Body Temperature",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description":
          "Body temperature can indicate health changes, such as a fever or hypothermia, if it’s too high or too low.",
      "ranges": [
        {"start": 0, "end": 97, "label": "Low"},
        {"start": 97, "end": 99, "label": "Normal"},
        {"start": 99, "end": 100, "label": "High"}
      ]
    },
    "Sleep": {
      "unit": "Hours",
      "label": "Sleep",
      "getValueFrom": "hours",
      "graph": "bar",
      "calculateValue": "",
      "ranges": [
        {"start": 0, "end": 6, "label": "Low"},
        {"start": 6, "end": 9, "label": "Normal"},
        {"start": 9, "end": 10, "label": "High"}
      ],
      "allowEscalation": false,
      "description":
          "Sleep refers to the total amount of time you spend sleeping each night, which is crucial for your body to rest and recover. Getting enough sleep hours is essential for maintaining energy, focus, and overall health."
    },
    "WaterIntake": {
      "unit": "Litres",
      "label": "Water Intake",
      "graph": "bar",
      "allowEscalation": false,
      "description":
          "Water intake is the amount of water you drink each day, essential for keeping your body hydrated and functioning properly."
    },
    "StepCount": {
      "unit": "Steps",
      "label": "Step Count",
      "graph": "bar",
      "allowEscalation": false,
      "description":
          "Step count is the number of steps you take in a day, used to measure your physical activity level. Tracking your step count helps you stay active and improve your overall fitness and health."
    },
    "BloodGlucose": {
      "unit": "",
      "label": "Blood Glucose",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description":
          "Blood glucose is the amount of sugar in your blood, which provides energy for your body. Keeping it at a healthy level is important for overall health and managing conditions like diabetes. You can get your blood glucose levels checked at home with a glucometer or through a blood test done in a lab."
    },
    "BabyKickCount": {
      "unit": "kicks per day",
      "label": "Baby Kick Count",
      "allowEscalation": true,
      "escalationCriteria": ["Low"],
      "symptomTracker": false,
      "description":
          "Keep track of your baby's daily movements with the Kick Counter. Log each kick throughout the day to monitor the total and stay aware of activity patterns.",
      "ranges": [
        {"start": 0, "end": 10, "label": "Low"},
        {"start": 10, "end": 100, "label": "Normal"}
      ]
    },
    "FastingBloodGlucose": {
      "parentVital": "BloodGlucose",
      "unit": "mg/dL",
      "label": "Fasting Blood Glucose",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description": "Fasting Blood Glucose",
      "ranges": [
        {"start": 0, "end": 70, "label": "Low"},
        {"start": 70, "end": 100, "label": "Normal"},
        {"start": 100, "end": 120, "label": "High"}
      ]
    },
    "RandomBloodGlucose": {
      "parentVital": "BloodGlucose",
      "unit": "mg/dL",
      "label": "Random Blood Glucose",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description": "Random Blood Glucose",
      "ranges": [
        {"start": 0, "end": 70, "label": "Low"},
        {"start": 70, "end": 141, "label": "Normal"},
        {"start": 141, "end": 200, "label": "High"}
      ]
    },
    "AfterBreakfastBloodGlucose": {
      "parentVital": "BloodGlucose",
      "unit": "mg/dL",
      "label": "After Breakfast Blood Glucose",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description": "After Breakfast Blood Glucose",
      "ranges": [
        {"start": 0, "end": 70, "label": "Low"},
        {"start": 70, "end": 141, "label": "Normal"},
        {"start": 141, "end": 200, "label": "High"}
      ]
    },
    "BeforeLunchBloodGlucose": {
      "parentVital": "BloodGlucose",
      "unit": "mg/dL",
      "label": "Before Lunch Blood Glucose",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description": "Before Lunch Blood Glucose",
      "ranges": [
        {"start": 0, "end": 70, "label": "Low"},
        {"start": 70, "end": 100, "label": "Normal"},
        {"start": 100, "end": 150, "label": "High"}
      ]
    },
    "BeforeDinnerBloodGlucose": {
      "parentVital": "BloodGlucose",
      "unit": "mg/dL",
      "label": "Before Dinner Blood Glucose",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description": "Before Dinner Blood Glucose",
      "ranges": [
        {"start": 0, "end": 70, "label": "Low"},
        {"start": 70, "end": 100, "label": "Normal"},
        {"start": 100, "end": 150, "label": "High"}
      ]
    },
    "AfterLunchBloodGlucose": {
      "parentVital": "BloodGlucose",
      "unit": "mg/dL",
      "label": "After Lunch Blood Glucose",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description": "After Lunch Blood Glucose",
      "ranges": [
        {"start": 0, "end": 70, "label": "Low"},
        {"start": 70, "end": 141, "label": "Normal"},
        {"start": 141, "end": 200, "label": "High"}
      ]
    },
    "AfterDinnerBloodGlucose": {
      "parentVital": "BloodGlucose",
      "unit": "mg/dL",
      "label": "After Dinner Blood Glucose",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low", "High"],
      "symptomTracker": true,
      "description": "Random Blood Glucose",
      "ranges": [
        {"start": 0, "end": 70, "label": "Low"},
        {"start": 70, "end": 141, "label": "Normal"},
        {"start": 141, "end": 200, "label": "High"}
      ]
    },
    "HbA1c": {
      "parentVital": "BloodGlucose",
      "unit": "%",
      "label": "HbA1c",
      "graph": "line",
      "allowEscalation": true,
      "escalationCriteria": ["Low"],
      "symptomTracker": true,
      "description": "HbA1c",
      "ranges": [
        {"start": 0, "end": 5.7, "label": "Normal"},
        {"start": 0, "end": 5.8, "label": "Low"},
        {"start": 5.8, "end": 10, "label": "High"}
      ]
    }
  };
  return vitalsConstants;
}

List<dynamic> rangeToGet(String? type) {
  List<double> result = [];
  try {
    dynamic range;
    final vitals = vitalsConfig();
    if (vitals[type]["ranges"] == null) {
      return type == "BloodPressure"
          ? [
              [0, 0],
              [0, 0]
            ]
          : [0, 0];
    }
    if (type == "BloodPressure") {
      print("Vital range >>>>>> ${vitals[type]["ranges"]["bp_sys"]}");
      List<List<double>> bpRanges = [];

      for (var key in ["bp_sys", "bp_dia"]) {
        if (vitals[type]["ranges"][key] != null) {
          var range = vitals[type]["ranges"][key]
              .where((elem) => elem["label"] == "Normal")
              .toList()[0];
          print(range);
          if (range != null) {
            bpRanges.add([
              range["start"] is num
                  ? (range["start"] as num).toDouble()
                  : range["start"],
              range["end"] is num
                  ? (range["end"] as num).toDouble()
                  : range["end"]
            ]);
          }
        }
      }

      return bpRanges.isNotEmpty
          ? bpRanges
          : [
              [0, 0],
              [0, 0]
            ];
    } else if (vitals[type]["ranges"] is List) {
      range = vitals[type]["ranges"].where((elem) {
        return elem["label"] == "Normal";
      }).toList()[0];
    } else {
      range = vitals[type]["ranges"]["resting"].where((elem) {
        return elem["label"] == "Normal";
      }).toList()[0];
    }
    result.add(range["start"] is num
        ? (range["start"] as num).toDouble()
        : range["start"]);
    result.add(
        range["end"] is num ? (range["end"] as num).toDouble() : range["end"]);
    return result;
  } catch (e) {
    print("rangeToget >>>>>>> $e");
    return type == "BloodPressure"
        ? [
            [0, 0],
            [0, 0]
          ]
        : [0, 0];
  }
}

String convertDateTimetoDate(DateTime dateTime) {
  return '${dateTime.day.toString().padLeft(2, '0')}/'
      '${dateTime.month.toString().padLeft(2, '0')}/'
      '${dateTime.year}';
}

dynamic convertOCRDataToJson(
  String? ocrJobId,
  List<ScanResultStruct>? ocrData,
) {
  if (ocrData == null || ocrJobId == null) return null;

  var ocrScanResult = ocrData.map((item) {
    return {
      "label": item.label,
      "value": {"result": item.value.result, "unit": item.value.unit}
    };
  }).toList();

  return ocrScanResult;

  // return [
  //   {
  //     "ocrJobId": ocrJobId,
  //     "ocrScanResult": ocrScanResult,
  //   }
  // ];

  // return {
  //   "ocrJobId": ocrJobId,
  //   "ocrScanResult": ocrData,
  // };
}

dynamic createJsonMapForMood(
  String id,
  List<String> emotions,
  String mood,
) {
  return {
    "uniqueIdentifier": id,
    "answer": {"mood": mood, "emotions": emotions}
  };
}

List<String> convertIntoListofString(dynamic data) {
  if (data is List) {
    return data.map((item) => item["title"] as String).toList();
  }
  return [];
}

List<dynamic> reverseList(List<dynamic> list) {
  return list.reversed.toList();
}
