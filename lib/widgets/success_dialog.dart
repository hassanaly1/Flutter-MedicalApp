import 'package:flutter/material.dart';
import 'package:medical_app/widgets/custom_button.dart';
import 'package:medical_app/widgets/custom_text_widget.dart';

class SuccessDialog extends StatefulWidget {
  final String text;
  final String subText;
  final String buttonText;
  final VoidCallback onTap;
  const SuccessDialog(
      {super.key,
      required this.text,
      required this.subText,
      required this.buttonText,
      required this.onTap});

  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Adjust the duration as needed
    );
    _scaleAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              );
            },
            child: const Icon(
              Icons.done,
              color: Colors.green,
              size: 40,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextWidget(
            text: widget.text,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
      content: CustomTextWidget(
        text: widget.subText,
        textColor: Colors.grey,
        textAlign: TextAlign.center,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      actions: [
        const SizedBox(height: 15),
        CustomButton(
          buttonText: widget.buttonText,
          onTap: widget.onTap,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
