import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name;
  final String amount;
  final String code;
  final IconData icon;
  final bool isInverted;
  final double order;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.amount,
    required this.code,
    required this.icon,
    required this.isInverted,
    this.order = 0,
  });

  Color bgColor() {
    return isInverted ? Colors.white : const Color(0xFF1F2123);
  }

  Color textColor() {
    return isInverted ? const Color(0xFF1F2123) : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final double offsetDy = -20 * order;
    return Transform.translate(
      offset: Offset(0, offsetDy),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor(),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: textColor(),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: textColor(),
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: textColor().withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(0, 14),
                  child: Icon(
                    icon,
                    color: textColor(),
                    size: 86,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
