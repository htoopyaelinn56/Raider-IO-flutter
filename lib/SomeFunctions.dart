import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'ProviderData/RioData.dart';
import 'Network/RioApi.dart';

Color getIoColor(double value) {
  if (value < 500.0) {
    return Colors.white;
  } else if (value > 2500.0) {
    return Colors.deepOrangeAccent;
  } else if (value > 2000.0) {
    return Color(0xffA330C9);
  } else if (value > 1000.0) {
    return const Color(0xff2962ff);
  } else if (value > 500) {
    return Colors.green.shade600;
  }
  return Colors.white;
}

Color getFactinColor(String faction) {
  if (faction == 'alliance') {
    return const Color(0xff2962ff);
  }
  return Colors.red;
}

Color getClassColor(String text) {
  Color c = Colors.black;
  if (text.contains("Mage")) {
    c = const Color(0xff3FC7EB);
  }
  if (text.contains("Warrior")) {
    c = const Color(0xffC69B6D);
  }
  if (text.contains("Paladin")) {
    c = const Color(0xffF48CBA);
  }
  if (text.contains("Druid")) {
    c = const Color(0xffFF7C0A);
  }
  if (text.contains("Monk")) {
    c = const Color(0xff00FF98);
  }
  if (text.contains("Warlock")) {
    c = const Color(0xff8788EE);
  }
  if (text.contains("Priest")) {
    c = const Color(0xffFFFFFF);
  }
  if (text.contains("Shaman")) {
    c = const Color(0xff0070DD);
  }
  if (text.contains("Hunter")) {
    c = const Color(0xffAAD372);
  }
  if (text.contains("Rogue")) {
    c = const Color(0xffFFF468);
  }
  if (text.contains("Demon Hunter")) {
    c = const Color(0xffA330C9);
  }
  if (text.contains("Death Knight")) {
    c = const Color(0xffC41E3A);
  }
  return c;
}

void showToast(String s) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}
