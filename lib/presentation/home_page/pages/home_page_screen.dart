import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/utils/dimensions.dart';
import 'package:ritaj_compound/core/widgets/app_bars/custom_app_bar.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/home_page/widgets/summary_card.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  static const String routeName = '/home-page-screen';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
@override
  void initState() {
    super.initState();
}

  @override
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Palette.green.shade700,
            child: const Icon(Icons.person,color: Colors.white,),
          ),
          10.horizontalSpace,
          const Icon(Icons.notifications),
          140.horizontalSpace,
          Column(
            children: [
              CustomText.s18('مرحبا احمد'),
              CustomText.s14('A-402 وحدة'),
            ],
          ),
          10.horizontalSpace,
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Palette.green.shade700,
            child: Icon(  Icons.apartment,color: Colors.white,),
          ),
        ],
      ),
    ),

    body: Padding(
      padding: Dimensions.defaultPagePadding,
      child: Column(
        children: [
          
          30.verticalSpace, 
          SummaryCard(
          
            firstItem: SummaryItem(
               icon: CircleAvatar(
    radius: 20.r,
    backgroundColor: Palette.yellow.shade400,
    child: Icon(
      Icons.person_add ,
      size: 20.sp,
      color: Colors.white,
    ),
  ),
              title: 'زائر متوقع',
              value: 'محمد علي - 2:30 م',
            ),
            secondItem: SummaryItem(
             icon: CircleAvatar(
               radius: 20.r,
  backgroundColor: Palette.orange.shade500,
  child: Icon(
    Icons.credit_card,
    size: 20.sp,
    color: Colors.white,
  ),
),

              title: 'قسط مستحق',
              value: '2,500 ج.م-خدمات',
            ),
          ),
        ],
      ),
    ),
  );
}
}