import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProgressIndicadorWidget extends StatefulWidget {
  const ProgressIndicadorWidget({super.key});

  @override
  State<ProgressIndicadorWidget> createState() =>
      _ProgressIndicadorWidgetState();
}

class _ProgressIndicadorWidgetState extends State<ProgressIndicadorWidget>
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
          'assets/popcorn.json',
          controller: _controller,
          width: 200,
          height: 200,
          repeat: true, // Faz a animação repetir
        ));
  }
}
