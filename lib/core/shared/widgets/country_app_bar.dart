import 'package:country_api/core/constants/country_color.dart';
import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:flutter/material.dart';

class CountryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isText;
  final bool automaticallyImplyLeading;
  final String? title;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingIconTap;
  final Color backgroundColor;
  final Color surfaceTintColor;
  final Color? leadingIconColor;
  final double dividerHeight;
  final bool showDivider;

  const CountryAppBar({
    super.key,
    this.title,
    this.actions,
    this.titleStyle,
    this.leadingIcon,
    this.leadingIconColor,
    this.titleWidget,
    this.isText = true,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
    this.onLeadingIconTap,
    this.backgroundColor = whiteColor,
    this.surfaceTintColor = transparent,
    this.dividerHeight = 5.0,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      surfaceTintColor: surfaceTintColor,
      leading: leadingIcon != null
          ? GestureDetector(
              onTap: onLeadingIconTap,
              child: Icon(
                leadingIcon,
                color: leadingIconColor ?? textColor,
              ),
            )
          : null,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      title: isText
          ? CountryText(
              text: title ?? '',
              style: titleStyle ??
                  bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            )
          : titleWidget,
      bottom: showDivider
          ? PreferredSize(
              preferredSize: Size(double.infinity, dividerHeight),
              child: Divider(
                color: greyColor[100],
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + dividerHeight);
}
