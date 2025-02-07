import 'package:country_api/core/constants/country_color.dart';
import 'package:country_api/core/shared/utils/country_sizes.dart';
import 'package:flutter/material.dart';

class CountryBtn extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? borderColor;
  final bool outline;
  final bool any;
  final TextStyle? style;
  final void Function()? onTap;

  const CountryBtn({
    super.key,
    this.style,
    this.onTap,
    this.color,
    this.borderColor,
    required this.title,
    this.outline = false,
    this.any = false,
  });

  const CountryBtn.outline({
    super.key,
    required this.title,
    this.style,
    this.onTap,
    this.color,
    this.borderColor,
  })  : outline = true,
        any = false;

  const CountryBtn.any({
    super.key,
    required this.title,
    this.style,
    this.onTap,
    this.color,
    this.borderColor,
  })  : any = true,
        outline = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: double.infinity,
        height: cHeight(context, .06),
        alignment: Alignment.center,
        decoration: any
            ? BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  style: BorderStyle.solid,
                  color: borderColor ?? orangeColor,
                ),
              )
            : outline
                ? BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: transparent, width: 1),
                  )
                : BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
        child: Center(
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
