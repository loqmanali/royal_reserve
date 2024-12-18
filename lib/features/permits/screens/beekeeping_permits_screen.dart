import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../data/remote_data/bee_regulations.dart';
import '../widgets/approval_and_confirmation.dart';
import '../widgets/bee_info_item.dart';
import '../widgets/date_time_form.dart';
import '../widgets/row_form.dart';
import '../widgets/row_form_background.dart';
import '../widgets/row_form_item.dart';

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
                  const RowFormBackground(
                    formItems: [
                      RowForm(
                        items: [
                          RowFormItem(label: 'اسم المستفيد'),
                          Gap(8),
                          RowFormItem(label: 'رقم الهوية'),
                        ],
                      ),
                      Gap(8),
                      RowForm(
                        items: [
                          RowFormItem(label: 'رقم الهاتف'),
                          Gap(8),
                          RowFormItem(label: 'البريد الالكتروني'),
                        ],
                      ),
                      Gap(8),
                      DateTimeForm(
                        labelTime: 'توقيت القدوم',
                        labelDate: 'تاريخ القدوم',
                      ),
                      Gap(8),
                      DateTimeForm(
                        labelTime: 'توقيت المغادرة',
                        labelDate: 'تاريخ المغادرة',
                      ),
                      Gap(8),
                      RowForm(
                        items: [
                          RowFormItem(
                            label: 'المنطقة المراد زيارتها داخل الموقع',
                          ),
                        ],
                      ),
                      Gap(8),
                      RowForm(
                        items: [
                          RowFormItem(label: 'الغرض من الزيارة'),
                        ],
                      ),
                      Gap(8),
                      ApprovalAndConfirmation(),
                    ],
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
