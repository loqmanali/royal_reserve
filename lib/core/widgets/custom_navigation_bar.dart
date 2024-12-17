import 'package:flutter/material.dart';
import 'package:royal_reserve/core/core.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<CustomNavigationDestination> destinations;
  final bool showDivider;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showDivider)
              const Divider(
                height: 1,
                thickness: 2,
                color: AppColors.primaryColor,
              ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                destinations.length,
                (index) => _NavigationBarItem(
                  destination: destinations[index],
                  isSelected: selectedIndex == index,
                  onTap: () => onDestinationSelected(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatefulWidget {
  final CustomNavigationDestination destination;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationBarItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_NavigationBarItem> createState() => _NavigationBarItemState();
}

class _NavigationBarItemState extends State<_NavigationBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(_NavigationBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // widget.destination.isSpecial
            //     ? Transform.translate(
            //         offset: const Offset(0, -13),
            //         child: CircleAvatar(
            //           radius: 25,
            //           child: widget.destination.icon,
            //         ),
            //       )
            //     :

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeInOutSine,
              switchOutCurve: Curves.easeOutCubic,
              child: widget.isSelected
                  ? widget.destination.selectedIcon
                  : KeyedSubtree(
                      key: const ValueKey('unselected'),
                      child: widget.destination.icon,
                    ),
            ),
            const Gap(8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              style: AppTextStyles.smallText.copyWith(
                fontWeight: FontWeight.w300,
                color: widget.isSelected
                    ? AppColors.primaryColor
                    : AppColors.black,
              ),
              child: Text(
                widget.destination.label,
                style: AppTextStyles.smallText.copyWith(
                  fontWeight:
                      widget.isSelected ? FontWeight.bold : FontWeight.w300,
                  color: widget.isSelected
                      ? AppColors.primaryColor
                      : AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavigationDestination {
  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final bool isSpecial;

  const CustomNavigationDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.isSpecial = false,
  });
}
