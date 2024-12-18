import 'package:flutter/material.dart';
import 'package:royal_reserve/core/core.dart';
import 'package:royal_reserve/features/permits/widgets/date_time_form.dart';

import '../data/remote_data/bee_regulations.dart';
import '../widgets/approval_and_confirmation.dart';
import '../widgets/bee_info_item.dart';
import '../widgets/row_form.dart';
import '../widgets/row_form_background.dart';
import '../widgets/row_form_item.dart';

class OffDutyWorkPermitScreen extends StatelessWidget {
  const OffDutyWorkPermitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: 'تصريح العمل خارج أوقات العمل',
            bgImage: AppImages.alSammanArea,
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
                    '- الضوابط والاشتراطات',
                    style: AppTextStyles.bodyText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.smallText2,
                    ),
                  ),
                  const Gap(16),
                  ...BeeRegulations.offDutyWorkPermitRegulations.map(
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
                      Gap(12),
                      RowForm(
                        items: [
                          RowFormItem(label: 'رقم الهاتف'),
                          Gap(8),
                          RowFormItem(label: 'البريد الإلكتروني'),
                        ],
                      ),
                      Gap(12),
                      DateTimeForm(
                        labelTime: 'توقيت الفدوم',
                        labelDate: 'تاريخ القدوم',
                      ),
                      Gap(12),
                      DateTimeForm(
                        labelTime: 'توقيت المغادرة',
                        labelDate: 'تاريخ المغادرة',
                      ),
                      Gap(12),
                      RowForm(
                        items: [
                          RowFormItem(
                            label: 'المنطقة المراد زيارتها داخل الموقع',
                          ),
                        ],
                      ),
                      Gap(12),
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
