import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProgressIndicador2Widget extends StatefulWidget {
  const ProgressIndicador2Widget({super.key});

  @override
  State<ProgressIndicador2Widget> createState() =>
      _ProgressIndicador2WidgetState();
}

class _ProgressIndicador2WidgetState extends State<ProgressIndicador2Widget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Lottie.asset(
          'assets/legal.json',
          controller: _controller,
          width: 200,
          height: 200,
          repeat: true, // Faz a animação repetir
        ));
  }
}
