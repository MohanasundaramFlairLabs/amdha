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
      "icon": "assets/icons/weight-icon.png",
      "unit": "cm",
      "label": "Height",
      "range": "50 - 250" // in cm
    },
    "Weight": {
      "color": Color(0x1533FF57),
      "iconColor": Color(0xFF33FF57),
      "icon": "assets/icons/weight-icon.png",
      "unit": "kg",
      "label": "Weight",
      "range": "2 - 200" // in kg
    },
    "Bmi": {
      "color": Color(0x153357FF),
      "iconColor": Color(0xFF3357FF),
      "icon": "assets/icons/bmi-icon.png",
      "unit": "kg/m²",
      "label": "BMI",
      "range": "10 - 40" // in kg/m²
    },
    "WaistCircumference": {
      "color": Color(0x15FF33A6),
      "iconColor": Color(0xFFFF33A6),
      "icon": "assets/icons/waist-icon.png",
      "unit": "cm",
      "label": "Waist Circumference",
      "range": "20 - 150" // in cm
    },
    "HipCircumference": {
      "color": Color(0x15A633FF),
      "iconColor": Color(0xFFA633FF),
      "icon": "assets/icons/hip-icon.png",
      "unit": "cm",
      "label": "Hip Circumference",
      "range": "30 - 160" // in cm
    },
    "WaistToHipRatio": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/ratio-icon.png",
      "unit": "",
      "label": "Waist to Hip Ratio",
      "range": "0.5 - 1.2" // ratio
    },
    "Steps": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/steps-icon.png",
      "unit": "",
      "label": "Steps",
      "range": "0 - 30000" // number of steps
    },
    "BloodPressure": {
      "color": Color(0x1533FFA6),
      "iconColor": Color(0xFF33FFA6),
      "icon": "assets/icons/blood-pressure-icon.png",
      "unit": "mmHg",
      "label": "Blood Pressure",
      "range": "80 - 180" // systolic blood pressure in mmHg
    },
    "HeartRate": {
      "color": Color(0x15A6FF33),
      "iconColor": Color(0xFFA6FF33),
      "icon": "assets/icons/heart-rate-icon.png",
      "unit": "bpm",
      "label": "Heart Rate",
      "range": "40 - 180" // in bpm
    },
    "BodyTemperature": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/temperature-icon.png",
      "unit": "°C",
      "label": "Body Temperature",
      "range": "35 - 42" // in °C
    },
    "BloodGlucose": {
      "color": Color(0x1533A6FF),
      "iconColor": Color(0xFF33A6FF),
      "icon": "assets/icons/glucose-icon.png",
      "unit": "mg/dL",
      "label": "Blood Glucose",
      "range": "70 - 200" // in mg/dL
    },
    "Sp02": {
      "color": Color(0x155733FF),
      "iconColor": Color(0xFF5733FF),
      "icon": "assets/icons/sp02-icon.png",
      "unit": "%",
      "label": "Sp02",
      "range": "85 - 100" // in percentage
    },
    "Sleep": {
      "color": Color(0x15FF33FF),
      "iconColor": Color(0xFFFF33FF),
      "icon": "assets/icons/sleep-icon.png",
      "unit": "hours",
      "label": "Sleep",
      "range": "0 - 24" // in hours
    },
    "CardiacOutput": {
      "color": Color(0x1533FF96),
      "iconColor": Color(0xFF33FF96),
      "icon": "assets/icons/cardiac-output-icon.png",
      "unit": "L/min",
      "label": "Cardiac Output",
      "range": "3 - 8" // in L/min
    },
    "MeanArterialPressure": {
      "color": Color(0x15FF9633),
      "iconColor": Color(0xFFFF9633),
      "icon": "assets/icons/map-icon.png",
      "unit": "mmHg",
      "label": "Mean Arterial Pressure",
      "range": "60 - 120" // in mmHg
    },
    "VO2Max": {
      "color": Color(0x1533FF57),
      "iconColor": Color(0xFF33FF57),
      "icon": "assets/icons/vo2max-icon.png",
      "unit": "ml/kg/min",
      "label": "VO2 Max",
      "range": "15 - 60" // in ml/kg/min
    },
    "RespirationRate": {
      "color": Color(0x155733A6),
      "iconColor": Color(0xFF5733A6),
      "icon": "assets/icons/respiration-icon.png",
      "unit": "breaths/min",
      "label": "Respiration Rate",
      "range": "12 - 20" // in breaths/min
    },
    "TotalBodyWater": {
      "color": Color(0x15FF5733),
      "iconColor": Color(0xFFFF5733),
      "icon": "assets/icons/tbw-icon.png",
      "unit": "L",
      "label": "Total Body Water",
      "range": "30 - 50" // in liters
    },
    "BodyWater": {
      "color": Color(0x1533FF96),
      "iconColor": Color(0xFF33FF96),
      "icon": "assets/icons/body-water-icon.png",
      "unit": "L",
      "label": "Body Water",
      "range": "20 - 45" // in liters
    },
    "BloodVolume": {
      "color": Color(0x1533A6FF),
      "iconColor": Color(0xFF33A6FF),
      "icon": "assets/icons/blood-volume-icon.png",
      "unit": "L",
      "label": "Blood Volume",
      "range": "4 - 6" // in liters
    },
    "TotalBodyFat": {
      "color": Color(0x15A633FF),
      "iconColor": Color(0xFFA633FF),
      "icon": "assets/icons/body-fat-icon.png",
      "unit": "%",
      "label": "Total Body Fat",
      "range": "5 - 35" // in percentage
    },
    "StressIndex": {
      "color": Color(0x15FF33A6),
      "iconColor": Color(0xFFFF33A6),
      "icon": "assets/icons/stress-icon.png",
      "unit": "",
      "label": "Stress Index",
      "range": "0 - 100" // arbitrary units
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
        range: attributes['range']);
  } else {
    return null;
  }

  return value;
}
