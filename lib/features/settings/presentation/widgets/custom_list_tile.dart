import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;

  final String title;
  final Widget? trailing;
  const CustomListTile({
    super.key,

    required this.title,
    this.trailing,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon != null ? Icon(icon, size: 28) : Center(),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: onTap == null ? Colors.grey : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              trailing ?? Icon(Icons.arrow_forward, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
