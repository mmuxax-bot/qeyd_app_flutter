import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const QeydApp());
}

class QeydApp extends StatelessWidget {
  const QeydApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qeyd App',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF03111E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDAB873),
          brightness: Brightness.dark,
        ),
      ),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.35),
            radius: 1.2,
            colors: [
              Color(0xFF173D59),
              Color(0xFF071827),
              Color(0xFF020910),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xFF071A29),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: const Color(0xFFDAB873),
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x553AC4FF),
                      blurRadius: 34,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_stories_rounded,
                  size: 66,
                  color: Color(0xFFFFDFA1),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Qeyd App',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 40,
                  color: Color(0xFFFFE8BD),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'K İ T A B L A R',
                style: TextStyle(
                  letterSpacing: 5,
                  color: Color(0xFFDAB873),
                ),
              ),
              const SizedBox(height: 34),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: Text(
                  'Biliklərini oxu, qeydlərini saxla və istədiyin zaman yenidən nəzərdən keçir.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.7,
                    color: Color(0xFFCCD5DC),
                  ),
                ),
              ),
              const Spacer(),
              const CircularProgressIndicator(
                color: Color(0xFFDAB873),
              ),
              const SizedBox(height: 14),
              const Text('Yüklənir...'),
             

