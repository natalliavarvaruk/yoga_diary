import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LotosButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const LotosButton({Key? key, required this.onTap, this.text = "Add practice"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/lotus_button2.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomPaint(
            size: Size(120, 60),
            painter: ArcTextPainter(text),
          ),
        ],
      ),
    );//.animate().scale(duration: 300.ms).then(delay: 100.ms).shake();
  }
}

class ArcTextPainter extends CustomPainter {
  final String text;

  ArcTextPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = 50.0;
    final startAngle = pi / 4; // Начинаем с 45°
    final endAngle = 3 * pi / 4; // Заканчиваем на 135°
    final angleStep = (endAngle - startAngle) / (text.length - 1);

    final textStyle = TextStyle(
      color: const Color.fromARGB(255, 130, 60, 210),

      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < text.length; i++) {
      final angle = startAngle + i * angleStep;
      final x = size.width / 2 + radius * cos(angle);
      final y = radius * sin(angle) + 30;

      textPainter.text =
          TextSpan(text: text[text.length - 1 - i], style: textStyle);
      textPainter.layout();

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(angle - pi / 2); // 🔥 Разворачиваем буквы правильно
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
