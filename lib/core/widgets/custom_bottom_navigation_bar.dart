import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/app_colors.dart';
import 'custom_text.dart';

/// Enum to define the type of icon to be used
enum IconType {
  svg,
  image,
  icon,
}

/// Abstract class for icon source
abstract class IconSource {
  IconType get type;
  String? get path;
  IconData? get iconData;
}

/// SVG icon source implementation
class SvgIconSource implements IconSource {
  @override
  final String? path;

  @override
  IconData? get iconData => null;

  @override
  IconType get type => IconType.svg;

  const SvgIconSource(this.path);
}

/// Image icon source implementation
class ImageIconSource implements IconSource {
  @override
  final String? path;

  @override
  IconData? get iconData => null;

  @override
  IconType get type => IconType.image;

  const ImageIconSource(this.path);
}

/// Material icon source implementation
class MaterialIconSource implements IconSource {
  @override
  String? get path => null;

  @override
  final IconData? iconData;

  @override
  IconType get type => IconType.icon;

  const MaterialIconSource(this.iconData);
}

/// Interface defining the behavior of a navigation item builder
abstract class NavigationItemBuilder {
  Widget buildIcon(IconSource source, Color color);
  Widget buildLabel(String text);
}

/// Default implementation of navigation item builder supporting multiple icon types
class DefaultNavigationItemBuilder implements NavigationItemBuilder {
  const DefaultNavigationItemBuilder();

  @override
  Widget buildIcon(IconSource source, Color color) {
    switch (source.type) {
      case IconType.svg:
        if (source.path == null) return const SizedBox();
        return SvgPicture.asset(
          source.path!,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      case IconType.image:
        if (source.path == null) return const SizedBox();
        return Image.asset(
          source.path!,
          color: color,
        );
      case IconType.icon:
        if (source.iconData == null) return const SizedBox();
        return Icon(
          source.iconData,
          color: color,
        );
    }
  }

  @override
  Widget buildLabel(String text) {
    return CustomText(
      text: text,
      style: const InputTextStyle(),
    );
  }
}

/// Interface for navigation items in the bottom navigation bar
abstract class NavigationItemModel {
  String get label;
  IconSource get iconSource;
  bool get isActive;

  BottomNavigationBarItem toBottomNavigationBarItem({
    required NavigationItemBuilder builder,
    required Color activeColor,
    required Color inactiveColor,
  });
}

/// Default implementation of NavigationItemModel
class CustomNavigationItem implements NavigationItemModel {
  @override
  final String label;

  final IconSource _iconSource;
  @override
  IconSource get iconSource => _iconSource;

  @override
  final bool isActive;

  const CustomNavigationItem({
    required this.label,
    required IconSource iconSource,
    this.isActive = false,
  }) : _iconSource = iconSource;

  /// Factory constructor for creating an item with SVG icon
  factory CustomNavigationItem.svg({
    required String label,
    required String svgPath,
    bool isActive = false,
  }) {
    return CustomNavigationItem(
      label: label,
      iconSource: SvgIconSource(svgPath),
      isActive: isActive,
    );
  }

  /// Factory constructor for creating an item with image icon
  factory CustomNavigationItem.image({
    required String label,
    required String imagePath,
    bool isActive = false,
  }) {
    return CustomNavigationItem(
      label: label,
      iconSource: ImageIconSource(imagePath),
      isActive: isActive,
    );
  }

  /// Factory constructor for creating an item with material icon
  factory CustomNavigationItem.icon({
    required String label,
    required IconData icon,
    bool isActive = false,
  }) {
    return CustomNavigationItem(
      label: label,
      iconSource: MaterialIconSource(icon),
      isActive: isActive,
    );
  }

  @override
  BottomNavigationBarItem toBottomNavigationBarItem({
    required NavigationItemBuilder builder,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    final color = isActive ? activeColor : inactiveColor;
    return BottomNavigationBarItem(
      icon: builder.buildIcon(iconSource, color),
      label: label,
    );
  }

  /// Creates a copy with the given fields replaced with new values
  CustomNavigationItem copyWith({
    String? label,
    IconSource? iconSource,
    bool? isActive,
  }) {
    return CustomNavigationItem(
      label: label ?? this.label,
      iconSource: iconSource ?? _iconSource,
      isActive: isActive ?? this.isActive,
    );
  }
}

/// Theme configuration for the bottom navigation bar
class BottomNavTheme {
  static const defaultTheme = BottomNavTheme();

  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double elevation;
  final double iconSize;
  final bool showLabels;
  final BottomNavigationBarType barType;

  const BottomNavTheme({
    this.backgroundColor = Colors.white,
    this.selectedItemColor = AppColors.primaryColor,
    this.unselectedItemColor = Colors.grey,
    this.elevation = 8.0,
    this.iconSize = 24.0,
    this.showLabels = true,
    this.barType = BottomNavigationBarType.fixed,
  });

  /// Creates a copy with the given fields replaced with new values
  BottomNavTheme copyWith({
    Color? backgroundColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    double? elevation,
    double? iconSize,
    bool? showLabels,
    BottomNavigationBarType? barType,
  }) {
    return BottomNavTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
      elevation: elevation ?? this.elevation,
      iconSize: iconSize ?? this.iconSize,
      showLabels: showLabels ?? this.showLabels,
      barType: barType ?? this.barType,
    );
  }
}

/// A customized bottom navigation bar widget that supports custom item builders and theming
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavigationItemModel> navigationItems;
  final BottomNavTheme theme;
  final NavigationItemBuilder itemBuilder;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.navigationItems,
    BottomNavTheme? theme,
    NavigationItemBuilder? itemBuilder,
  })  : theme = theme ?? BottomNavTheme.defaultTheme,
        itemBuilder = itemBuilder ?? const DefaultNavigationItemBuilder();

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return navigationItems
        .map((item) => item.toBottomNavigationBarItem(
              builder: itemBuilder,
              activeColor: theme.selectedItemColor,
              inactiveColor: theme.unselectedItemColor,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _buildNavigationItems(),
      currentIndex: currentIndex,
      onTap: onTap,
      // backgroundColor: theme.backgroundColor,
      selectedItemColor: theme.selectedItemColor,
      unselectedItemColor: theme.unselectedItemColor,
      elevation: theme.elevation,
      iconSize: theme.iconSize,
      type: theme.barType,
      showSelectedLabels: theme.showLabels,
      showUnselectedLabels: theme.showLabels,
    );
  }
}
