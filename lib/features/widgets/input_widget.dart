import 'package:cambio_seguro_demo/core/constants/constant_color.dart';
import 'package:flutter/material.dart';

enum Currency { PEN, USD }

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Currency currency;
  final String label;

  const InputWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.currency,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstantColor.kPrimary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFFF3F3F6),
                width: 200,
                child: Center(
                  child: Text(
                    Currency.PEN == currency ? 'Soles' : 'Dólares',
                    style: const TextStyle(
                      color: ConstantColor.kPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              child: Text(
                                currency == Currency.PEN ? 'S/' : '\$',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: controller,
                              onChanged: onChanged,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
