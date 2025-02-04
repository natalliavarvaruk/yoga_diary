import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LotosButton extends StatelessWidget {
  final VoidCallback onTap;

  const LotosButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        //mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/lotus_button.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //).animate().scale(duration: 300.ms).then(delay: 100.ms).shake(),
          const SizedBox(height: 8),
          Text(
            'Add practice',
            style: Theme.of(context).textTheme.bodySmall,
            
          ),
          //).animate().fade(duration: 500.ms),
        ],
      ),
    );
  }
}

