import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/utils/dimensions.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';


class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.firstItem,
    required this.secondItem,
  });

  final SummaryItem firstItem;
  final SummaryItem secondItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.sw,
      height: 240.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Palette.green.shade700,
            Palette.green.shade900,
          ],
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: Dimensions.defaultPagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                    CustomText.s14("الثلاثاء, 15 اكتوبر ", color: Colors.white,),
                    130.horizontalSpace,
                 CustomText.s20("اليوم", color: Colors.white,),
             
               ],
             ),
            20.verticalSpace,
            _TransparentBox(item: firstItem),
            10.verticalSpace,
            _TransparentBox(item: secondItem),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}

/// ================= MODEL =================
class SummaryItem {
  final Widget icon;
  final String title;
  final String value;

  SummaryItem({
    required this.icon,
    required this.title,
    required this.value,
  });
}

/// ================= UI WIDGET =================
class _TransparentBox extends StatelessWidget {
  const _TransparentBox({required this.item});

  final SummaryItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.30),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             
              CustomText.s16(
                item.title,
                color: Colors.white,
              ),
              CustomText.s16(
                item.value,
                color: Colors.white,
              ),
              
            ],
          ),
          15.horizontalSpace,
   
            item.icon,
           
          
        ],
      ),
    );
  }
}
