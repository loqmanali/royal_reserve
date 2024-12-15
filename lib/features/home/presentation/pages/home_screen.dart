import 'package:flutter/material.dart';
import 'package:royal_reserve/core/base/base_screen.dart';
import 'package:royal_reserve/core/widgets/text_field_component.dart';

import '../../../../core/constant/app_images.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  State<BaseScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  @override
  Widget buildBody(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFieldComponent(
            keyName: 'search',
            hintText: 'ابحث عن جولة',
            borderRadius: 20,
            backgroundColor: AppColors.backgroundColor,
            showPrefixIcon: true,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: CustomText(
              text: 'جولتنا',
              style: InputTextStyle(
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          SafariCard(),
        ],
      ),
    );
  }

  @override
  Widget? buildDrawer() {
    return const Drawer();
  }

  @override
  List<Widget>? get appBarActions => [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: AppColors.primaryColor,
            size: 20.0,
          ),
        ),
      ];
}

class SafariCard extends StatelessWidget {
  const SafariCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 160,
        child: Stack(
          children: [
            // Image
            Container(
              height: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.safariImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Gradient overlay
            Container(
              height: 240,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),

            // Heart icon
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),

            // Arabic text
            const Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Text(
                'جولة حرة بالمحمية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
