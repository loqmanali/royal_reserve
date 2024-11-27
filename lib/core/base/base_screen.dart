import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reserve/core/constant/app_images.dart';
import 'package:royal_reserve/core/router/app_router.dart';
import 'package:royal_reserve/core/widgets/custom_bottom_navigation_bar.dart';

import '../style/app_colors.dart';

/// Screen state to handle loading and error states
class ScreenState {
  final bool isLoading;
  final String? errorMessage;
  final bool hasError;

  const ScreenState({
    this.isLoading = false,
    this.errorMessage,
    this.hasError = false,
  });

  ScreenState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? hasError,
  }) {
    return ScreenState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
    );
  }
}

/// Interface for screen configuration
mixin ScreenConfiguration {
  /// The title displayed in the app bar
  String get pageTitle => '';

  /// Background color of the screen
  Color? get backgroundColor => null;

  /// App bar color
  Color get appBarColor => AppColors.backgroundColor;

  /// App bar actions
  List<Widget>? get appBarActions => null;

  /// Leading widget in app bar
  Widget? get leading => null;

  /// Whether to show the back button
  bool get showBackButton => true;

  /// Whether to show the app bar
  bool get showAppBar => true;

  /// Whether to show floating action button
  bool get showFloatingActionButton => false;

  /// Whether to show bottom navigation bar
  bool get showBottomNavigationBar => true;

  /// App bar elevation
  double get appBarElevation => 0;

  /// Body padding
  EdgeInsets get bodyPadding => EdgeInsets.zero;
}

/// Interface for screen components
mixin ScreenComponents {
  /// Main content of the screen
  Widget buildBody(BuildContext context);

  /// Optional drawer widget
  Widget? buildDrawer() => null;

  /// Optional bottom navigation bar
  Widget? buildBottomNavigationBar() => null;

  /// Optional floating action button
  Widget? buildFloatingActionButton() => null;

  /// Build custom error widget
  Widget buildError(String message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: AppColors.errorColor,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  /// Build loading indicator
  Widget buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );
}

/// Base widget for base screen
abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState();
}

/// Base state for base screen implementing both configuration and components
abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    with ScreenConfiguration, ScreenComponents {
  /// Screen state management
  ScreenState _screenState = const ScreenState();

  /// Getters for screen state
  bool get isLoading => _screenState.isLoading;
  String? get errorMessage => _screenState.errorMessage;
  bool get hasError => _screenState.hasError;

  /// Update screen state
  void setScreenState(ScreenState state) {
    setState(() => _screenState = state);
  }

  /// Show loading state
  void showLoading() {
    setScreenState(_screenState.copyWith(isLoading: true, hasError: false));
  }

  /// Hide loading state
  void hideLoading() {
    setScreenState(_screenState.copyWith(isLoading: false));
  }

  /// Show error state
  void showError(String message) {
    setScreenState(_screenState.copyWith(
      hasError: true,
      errorMessage: message,
      isLoading: false,
    ));
  }

  int currentIndex = 0;
  void onNavigationTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.home);
        break;
      case 1:
        context.goNamed(AppRoutes.tickets);
        break;
      case 2:
        context.goNamed(AppRoutes.map);
        break;
      case 3:
        context.goNamed(AppRoutes.profile);
        break;
    }
  }

  @override
  Widget? buildBottomNavigationBar() {
    if (!showBottomNavigationBar) return null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 1,
          thickness: 2,
          color: AppColors.primaryColor,
        ),
        CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            onNavigationTap(index);
          },
          navigationItems: [
            CustomNavigationItem.svg(
              label: 'الرئيسية',
              svgPath: AppImages.homeIcon,
              isActive: currentIndex == 0,
            ),
            CustomNavigationItem.svg(
              label: 'التذاكر',
              svgPath: AppImages.ticketIcon,
              isActive: currentIndex == 1,
            ),
            CustomNavigationItem.svg(
              label: 'الخريطة',
              svgPath: AppImages.mapIcon,
              isActive: currentIndex == 2,
            ),
            CustomNavigationItem.svg(
              label: 'الملف الشخصي',
              svgPath: AppImages.profileIcon,
              isActive: currentIndex == 3,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? _buildAppBar() : null,
      body: SafeArea(
        child: Padding(
          padding: bodyPadding,
          child: _buildScreenContent(),
        ),
      ),
      drawer: buildDrawer(),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton:
          showFloatingActionButton ? buildFloatingActionButton() : null,
      backgroundColor: backgroundColor,
    );
  }

  Widget _buildScreenContent() {
    if (isLoading) return buildLoading();
    if (hasError) return buildError(errorMessage ?? 'Unknown error occurred');
    return buildBody(context);
  }

  PreferredSizeWidget? _buildAppBar() {
    return CustomAppBar(
      title: pageTitle,
      actions: appBarActions,
      color: appBarColor,
      leading: _buildLeadingWidget(),
      elevation: appBarElevation,
    );
  }

  Widget? _buildLeadingWidget() {
    if (!showBackButton) return null;
    if (leading != null) return leading;

    return Navigator.canPop(context)
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        : null;
  }
}

/// Custom app bar with consistent styling
class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String title,
    super.leading,
    super.actions,
    Color? color,
    double? elevation,
  }) : super(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: elevation ?? 0,
          backgroundColor: color,
        );
}
