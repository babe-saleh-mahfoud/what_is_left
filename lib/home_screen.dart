import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_is_left/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.birthDate});
  final String birthDate;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _yearsLeft = 0;
  int _monthsLeft = 0;
  int _daysLeft = 0;
  int _hoursLeft = 0;
  int _minutesLeft = 0;
  int _secondsLeft = 0;
  @override
  void initState() {
    _yearsLeft = yearsLeft(widget.birthDate);
    _monthsLeft = monthsLeft(widget.birthDate);
    _daysLeft = daysLeft(widget.birthDate);
    _hoursLeft = hoursLeft(widget.birthDate);
    _minutesLeft = minutesLeft(widget.birthDate);
    _secondsLeft = secondsLeft(widget.birthDate);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _yearsLeft = yearsLeft(widget.birthDate);
        _monthsLeft = monthsLeft(widget.birthDate);
        _daysLeft = daysLeft(widget.birthDate);
        _hoursLeft = hoursLeft(widget.birthDate);
        _minutesLeft = minutesLeft(widget.birthDate);
        _secondsLeft = secondsLeft(widget.birthDate);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$_yearsLeft',
              style: kNumberTextStyle.copyWith(
                  fontSize: screenWidth(context) * 0.15),
            ),
            Text(
              ' years',
              style: kNumberTextStyle.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 2,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: screenWidth(context) * 0.04),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: screenWidth(context) * 0.2,
              endIndent: screenWidth(context) * 0.2,
            ),
            Text(
              '$_monthsLeft',
              style: kNumberTextStyle.copyWith(
                  fontSize: screenWidth(context) * 0.1),
            ),
            Text(
              ' months',
              style: kNumberTextStyle.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 2,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: screenWidth(context) * 0.04),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: screenWidth(context) * 0.3,
              endIndent: screenWidth(context) * 0.3,
            ),
            Text(
              '$_daysLeft',
              style: kNumberTextStyle.copyWith(
                  fontSize: screenWidth(context) * 0.1),
            ),
            Text(
              ' days',
              style: kNumberTextStyle.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 2,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: screenWidth(context) * 0.04),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: screenWidth(context) * 0.4,
              endIndent: screenWidth(context) * 0.4,
            ),
            Text(
              '$_hoursLeft',
              style: kNumberTextStyle.copyWith(
                  fontSize: screenWidth(context) * 0.1),
            ),
            Text(
              ' hours',
              style: kNumberTextStyle.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 2,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: screenWidth(context) * 0.04),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: screenWidth(context) * 0.5,
              endIndent: screenWidth(context) * 0.5,
            ),
            Text(
              '$_minutesLeft',
              style: kNumberTextStyle.copyWith(
                  fontSize: screenWidth(context) * 0.1),
            ),
            Text(
              ' minutes',
              style: kNumberTextStyle.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 2,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: screenWidth(context) * 0.04),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: screenWidth(context) * 0.6,
              endIndent: screenWidth(context) * 0.6,
            ),
            Text(
              '$_secondsLeft',
              style: kNumberTextStyle.copyWith(
                  fontSize: screenWidth(context) * 0.1),
            ),
            Text(
              ' seconds',
              style: kNumberTextStyle.copyWith(
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 2,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: screenWidth(context) * 0.04),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: screenWidth(context) * 0.7,
              endIndent: screenWidth(context) * 0.7,
            ),
          ],
        ),
      ),
    );
  }
}

int yearsLeft(String birthDate) {
  return 73 - (DateTime.now().year - int.parse(birthDate.split('-')[0]));
}

int monthsLeft(String birthDate) {
  return 12 - (DateTime.now().month - int.parse(birthDate.split('-')[1]));
}

int daysLeft(String birthDate) {
  return 31 - (DateTime.now().day - int.parse(birthDate.split('-')[2]));
}

int hoursLeft(String birthDate) {
  return 24 - DateTime.now().hour;
}

int minutesLeft(String birthDate) {
  return 60 - DateTime.now().minute;
}

int secondsLeft(String birthDate) {
  return 60 - DateTime.now().second;
}
