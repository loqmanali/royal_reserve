import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reserve/core/widgets/date_time_range_selector.dart';
import 'package:royal_reserve/core/widgets/dialog_picker.dart';

import '../../../../core/core.dart';

class BeekeepingPermitsScreen extends StatelessWidget {
  const BeekeepingPermitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: 'تصريح المناحل',
            bgImage: AppImages.bannerBg,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(16),
                  Text(
                    '- الضوابط والشروط',
                    style: AppTextStyles.bodyText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.smallText2,
                    ),
                  ),
                  const Gap(16),
                  ...BeeRegulations.regulations.map(
                    (item) => BeeInfoItem(
                      text: item.text,
                      hasBackground: item.hasBackground,
                    ),
                  ),
                  const Gap(16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.bannerBg),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: TextFieldComponentWithLabel(
                                labelName: 'اسم المستفيد',
                                labelColor: AppColors.white,
                                formField: TextFieldComponent(
                                  keyName: 'beneficiaryName',
                                  hintText: '',
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: TextFieldComponentWithLabel(
                                labelName: 'رقم الهوية',
                                labelColor: AppColors.white,
                                formField: TextFieldComponent(
                                  keyName: 'beneficiaryId',
                                  hintText: '',
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        const Row(
                          children: [
                            Expanded(
                              child: TextFieldComponentWithLabel(
                                labelName: 'رقم الهاتف',
                                labelColor: AppColors.white,
                                formField: TextFieldComponent(
                                  keyName: 'phoneNumber',
                                  hintText: '',
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: TextFieldComponentWithLabel(
                                labelName: 'البريد الالكتروني',
                                labelColor: AppColors.white,
                                formField: TextFieldComponent(
                                  keyName: 'email',
                                  hintText: '',
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Expanded(
                              child: DateTimeRangeSelector(
                                label: 'توقيت القدوم',
                                hintText: '--:--',
                                icon: Icons.watch_later_outlined,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => DialogPicker(
                                      child: CustomTimePicker(
                                        title: 'اختر وقت القدوم',
                                        timeSlots: const [
                                          TimeSlot(
                                            time: '08:00',
                                            isAvailable: true,
                                          ),
                                          TimeSlot(
                                            time: '09:00',
                                            isAvailable: true,
                                          ),
                                        ],
                                        onTimeSelected: (time) {
                                          print(time);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              flex: 2,
                              child: DateTimeRangeSelector(
                                label: 'تاريخ القدوم',
                                hintText: '--/--/----',
                                icon: Icons.calendar_today_rounded,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const DialogPicker(
                                      child: CustomDatePicker(
                                        title: 'اختر تاريخ القدوم',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Expanded(
                              child: DateTimeRangeSelector(
                                label: 'توقيت المغادرة',
                                hintText: '--:--',
                                icon: Icons.watch_later_outlined,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => DialogPicker(
                                      child: CustomTimePicker(
                                        title: 'اختر وقت المغادرة',
                                        timeSlots: const [
                                          TimeSlot(
                                            time: '10:00',
                                            isAvailable: true,
                                          ),
                                          TimeSlot(
                                            time: '11:00',
                                            isAvailable: true,
                                          ),
                                        ],
                                        onTimeSelected: (time) {
                                          print(time);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              flex: 2,
                              child: DateTimeRangeSelector(
                                label: 'تاريخ المغادرة',
                                hintText: '--/--/----',
                                icon: Icons.calendar_today_rounded,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const DialogPicker(
                                      child: CustomDatePicker(
                                        title: 'اختر تاريخ المغادرة',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        const TextFieldComponentWithLabel(
                          labelName: 'المنطقة المراد زيارتها داخل الموقع',
                          labelColor: AppColors.white,
                          formField: TextFieldComponent(
                            keyName: 'area',
                            hintText: '',
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        const Gap(8),
                        const TextFieldComponentWithLabel(
                          labelName: 'الغرض من الزيارة',
                          labelColor: AppColors.white,
                          formField: TextFieldComponent(
                            keyName: 'purpose',
                            hintText: '',
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        const Gap(8),
                        CustomRadioMenuButton(
                          value: 1,
                          groupValue: 2,
                          onChanged: (value) {},
                          child: Text(
                            'أقر بقراءة الشروط والضوابط والعمل بها',
                            style: AppTextStyles.smallText.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 40),
                            ),
                            child: Text(
                              'تسجيل',
                              style: AppTextStyles.buttonText.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BeeInfoItem extends StatelessWidget {
  final String text;
  final bool hasBackground;

  const BeeInfoItem({
    super.key,
    required this.text,
    this.hasBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.beeIcon),
        const Gap(8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: hasBackground ? AppColors.smallText3 : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.darkTextColor,
                fontSize: 10.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BeeRegulation {
  final String text;
  final bool hasBackground;

  const BeeRegulation({
    required this.text,
    required this.hasBackground,
  });
}

// List of all regulations
class BeeRegulations {
  static const List<BeeRegulation> regulations = [
    BeeRegulation(
      text: 'يمنع وضع المناحل المتنقلة داخل الروضات.',
      hasBackground: true,
    ),
    BeeRegulation(
      text:
          'الالتزام باستخدام الطرق الترابية الحالية وعدم شق طريق جديدة للحفاظ على الغطاء النباتي.',
      hasBackground: false,
    ),
    BeeRegulation(
      text: 'الحفاظ على مستوى نظافة المنطقة وتلافي رمي المخلفات بكافة أنواعها.',
      hasBackground: true,
    ),
    BeeRegulation(
      text: 'عدم التعرض للحياة الفطرية داخل المحمية.',
      hasBackground: false,
    ),
    BeeRegulation(
      text:
          'عدم العبث أو قطع الأشجار أو الأعشاب والالتزام بالحفاظ على الغطاء النباتي.',
      hasBackground: true,
    ),
    BeeRegulation(
      text: 'عدم القيام بأي أعمال تؤدي إلى تغيير طبيعة أرض المحمية.',
      hasBackground: false,
    ),
    BeeRegulation(
      text: 'عدم إشعال النار في المحمية بدون موقد.',
      hasBackground: true,
    ),
    BeeRegulation(
      text: 'الالتزام بارتداء البذور ووسائل الحماية للوقاية من لسعات النحل.',
      hasBackground: false,
    ),
    BeeRegulation(
      text: 'يتم نقل المناحل بطريقة آمنة تضمن عدم انتشار النحل في المناطق.',
      hasBackground: true,
    ),
    BeeRegulation(
      text:
          'يلتزم صاحب المنحل بالمواقع المحددة من قبل الهيئة وعدم تغيير الموقع إلا بعد أخذ الموافقة المسبقة من الهيئة.',
      hasBackground: false,
    ),
    BeeRegulation(
      text: 'عدم استخدام أرض المحمية لأي نشاط آخر غير مرخص به.',
      hasBackground: true,
    ),
    BeeRegulation(
      text:
          'يجب وضع اللوحات التحذيرية حول المناحل والالتزام بوضع نسخة من التصريح الصادر من الهيئة على المنحل.',
      hasBackground: false,
    ),
    BeeRegulation(
      text:
          'يحق للهيئة اتخاذ كافة الإجراءات النظامية في حالة عدم الالتزام بالضوابط والاشتراطات فيجوز للهيئة إلغاء التصريح واتخاذ الإجراءات النظامية اللازمة.',
      hasBackground: true,
    ),
    BeeRegulation(
      text:
          'يتحمل صاحب المنحل كامل المسؤولية تجاه أي ضرر يحدث تجاه الأشخاص أو الممتلكات ناجحة عن المنحل و/أو الأدوات الخاصة به بدون أي تبعات قانونية أو مالية على الهيئة.',
      hasBackground: false,
    ),
  ];
}

// Widget for displaying individual regulation item
class BeeRegulationItem extends StatelessWidget {
  final String text;
  final bool hasBackground;

  const BeeRegulationItem({
    super.key,
    required this.text,
    required this.hasBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.beeIcon),
        const Gap(8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: hasBackground ? AppColors.smallText3 : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.darkTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.bgImage,
  });
  final String title;
  final String bgImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100.h,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            /// Background Image
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage(bgImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            /// Logo and Menu Icon - Always Visible with SafeArea Padding
            Positioned(
              top: MediaQuery.paddingOf(context).top + 8.w,
              left: 16.w,
              right: 16.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.logoWithText,
                    width: 100.w,
                  ),
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            /// Text in Center
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
