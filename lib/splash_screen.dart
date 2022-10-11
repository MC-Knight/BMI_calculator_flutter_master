import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/bmi_screen.dart';
//splash screen starting first
const knbackgroundColor = Color(0xFF263238);

class SplashScreenPage extends StatefulWidget {
	const SplashScreenPage({super.key});

	@override
	State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

	@override
	void initState() {
		super.initState();
		Timer(
			const Duration(seconds: 5),
			() => Navigator.pushReplacement(
				context,
				MaterialPageRoute(
					builder: (context) => const BmiScreen())));
	}

	@override
	Widget build(BuildContext context){
		return Container(
			color: knbackgroundColor,
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
				ClipRRect(
					borderRadius: const BorderRadius.only(
						topLeft: Radius.circular(8.0),
						topRight: Radius.circular(8.0),
						bottomLeft: Radius.circular(8.0),
						bottomRight: Radius.circular(8.0),
					),
					child: Image.asset('assets/icon.png',
						width: 50,
						height: 50
						),
				  ),

				const DefaultTextStyle(
					style: TextStyle(
						color: Colors.white,
						fontSize: 15,
						fontWeight: FontWeight.bold,
						),
					child: Text('Knight BMI Calculator')
					),
				],
			),
		);
	}
	
}


         
