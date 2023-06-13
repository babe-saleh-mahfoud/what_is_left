import 'package:flutter/material.dart';
import 'package:what_is_left/constants.dart';
import 'package:what_is_left/home_screen.dart';
import 'package:what_is_left/main.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: TextField(
        style: kTextFieldStyle,
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          focusColor: kAccentColor,
          hoverColor: kAccentColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class PickDateScreen extends StatefulWidget {
  const PickDateScreen({super.key});

  @override
  State<PickDateScreen> createState() => _PickDateScreenState();
}

class _PickDateScreenState extends State<PickDateScreen> {
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBacgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(controller: _yearController),
                  const Text('/'),
                  AppTextField(controller: _monthController),
                  const Text('/'),
                  AppTextField(controller: _dayController),
                ],
              ),
              SizedBox(
                height: screenHeight(context) * 0.1,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                onPressed: () async {
                  String birthDate =
                      '${_yearController.text}-${_monthController.text}-${_dayController.text}';
                  cacheBirthDate(birthDate).then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(birthDate: birthDate),
                      ),
                    );
                  });
                },
                child: Text('Submit',
                    style: kButtonTextStyle.copyWith(
                      fontSize: screenWidth(context) * 0.08,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
