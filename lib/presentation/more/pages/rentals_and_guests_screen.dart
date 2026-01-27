import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/more/widgets/more_sidebar.dart';

class RentalsAndGuestsScreen extends StatelessWidget {
  static const routeName = '/more/rentals-guests';
  const RentalsAndGuestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      drawer: const AppSideBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios),
            ),
            10.horizontalSpace,
            CustomText.s18(
              l10n.rentalsAndGuests,
              bold: true,
            ),
            const Spacer(),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rental Status Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Palette.green.shade700,
                    Palette.green.shade900,
                  ],
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText.s20(
                        l10n.rentalStatus,
                        color: Colors.white,
                        bold: true,
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: CustomText.s12(
                          l10n.active,
                          color: Colors.white,
                          bold: true,
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  _buildRentalInfoRow(l10n.startDate, l10n.january15_2024),
                  8.verticalSpace,
                  _buildRentalInfoRow(l10n.endDate, l10n.january14_2025),
                  8.verticalSpace,
                  _buildRentalInfoRow(
                      l10n.rentPeriod, l10n.threeMonthsTwoWeeks),
                  16.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.warning,
                        color: Colors.orange,
                        size: 20.w,
                      ),
                      8.horizontalSpace,
                      CustomText.s14(
                        l10n.contractDetails,
                        color: Colors.orange,
                        bold: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            24.verticalSpace,

            // Contract Expiry Warning
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: Colors.orange,
                        size: 24.w,
                      ),
                      8.horizontalSpace,
                      CustomText.s16(
                        l10n.contractExpiry,
                        color: Colors.orange.shade800,
                        bold: true,
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  SizedBox(
                    width: 260.w,
                    child: CustomText.s14(
                      l10n.contractExpiryMessage,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  16.verticalSpace,
                  SizedBox(
                    width: 290.w,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: CustomText.s14(
                          l10n.contactOwner,
                          color: Colors.white,
                          bold: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            24.verticalSpace,

            // Tenant Information Section
            _buildSectionTitle(l10n.tenantInfo),
            12.verticalSpace,
            _buildTenantCard(l10n),

            24.verticalSpace,

            // Owner Information Section
            _buildSectionTitle(l10n.ownerData),
            12.verticalSpace,
            _buildOwnerCard(l10n),

            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildRentalInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.s14(
          label,
          color: Colors.white70,
        ),
        CustomText.s14(
          value,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomText.s18(
        title,
        bold: true,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTenantCard(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.green.shade100,
            ),
            child: Icon(
              Icons.person,
              color: Palette.green.shade700,
              size: 30.w,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s16(
                  'أحمد محمد علي',
                  bold: true,
                  color: Colors.black87,
                ),
                4.verticalSpace,
                CustomText.s14(
                  l10n.mainTenant,
                  color: Colors.grey[600],
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16.w,
                      color: Colors.blue,
                    ),
                    4.horizontalSpace,
                    CustomText.s12(
                      '+20 100 123 4567',
                      color: Colors.blue,
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  children: [
                    CustomText.s12(
                      l10n.nationalIdNumber,
                      color: Colors.grey[600],
                    ),
                    8.horizontalSpace,
                    CustomText.s12(
                      'CMT-2024-001',
                      color: Colors.black87,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.edit,
            size: 20.w,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerCard(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade100,
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.blue.shade700,
                  size: 30.w,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s16(
                      l10n.khaledAhmedAli,
                      bold: true,
                      color: Colors.black87,
                    ),
                    4.verticalSpace,
                    CustomText.s14(
                      l10n.unitOwnerTitle,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.verified_user,
                  color: Colors.green,
                  size: 24.w,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s12(
                      l10n.contractNumber,
                      color: Colors.grey[600],
                    ),
                    2.verticalSpace,
                    CustomText.s14(
                      '29012345678901',
                      bold: true,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s12(
                      l10n.nationalIdShort,
                      color: Colors.grey[600],
                    ),
                    2.verticalSpace,
                    CustomText.s14(
                      'CMT-2024-001',
                      bold: true,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                        size: 20.w,
                      ),
                      8.horizontalSpace,
                      CustomText.s14(
                        l10n.call,
                        color: Colors.blue,
                        bold: true,
                      ),
                    ],
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        color: Colors.green,
                        size: 20.w,
                      ),
                      8.horizontalSpace,
                      CustomText.s14(
                        l10n.whatsapp,
                        color: Colors.green,
                        bold: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
