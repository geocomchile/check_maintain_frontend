import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
    const CustomButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: colors.secondaryContainer,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: colors.onBackground,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(color: colors.onBackground),
                    )
                  ],
                )),
          ),
        ));
  }
}
