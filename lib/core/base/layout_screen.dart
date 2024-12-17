import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_reserve/core/core.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/map/screen/map_screen.dart';
import '../../features/profile/screen/profile_screen.dart';
import '../../features/tickets/screen/tickets_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;

  void onDestinationSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const TicketsScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];

  @override

  /// A Scaffold with a bottom navigation bar.
  ///
  /// The Scaffold's body is one of the pages in [_pages], as determined by
  /// [_currentIndex]. The bottom navigation bar is a [CustomNavigationBar]
  /// with the destinations specified in the [destinations] parameter.
  ///
  /// The [CustomNavigationBar] is configured with [_currentIndex] as its
  /// [selectedIndex], and [onDestinationSelected] as its
  /// [onDestinationSelected] callback.
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          CustomNavigationDestination(
            icon: SvgPicture.asset(AppImages.homeIcon),
            selectedIcon: SvgPicture.asset(
              AppImages.homeIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryContainer,
                BlendMode.srcIn,
              ),
            ),
            label: 'الرئيسية',
          ),
          CustomNavigationDestination(
            icon: SvgPicture.asset(AppImages.ticketIcon),
            selectedIcon: SvgPicture.asset(
              AppImages.ticketIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryContainer,
                BlendMode.srcIn,
              ),
            ),
            label: 'التذاكر',
          ),
          CustomNavigationDestination(
            icon: SvgPicture.asset(AppImages.mapIcon),
            selectedIcon: SvgPicture.asset(
              AppImages.mapIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryContainer,
                BlendMode.srcIn,
              ),
            ),
            label: 'الخريطة',
            isSpecial: true,
          ),
          CustomNavigationDestination(
            icon: SvgPicture.asset(AppImages.profileIcon),
            selectedIcon: SvgPicture.asset(
              AppImages.profileIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryContainer,
                BlendMode.srcIn,
              ),
            ),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }
}
