import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/more/widgets/more_sidebar.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = '/more';
  const MoreScreen({super.key});

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
              l10n.profile,
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
            // Profile Header Card
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
                  // Profile Image
                  Row(
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  size: 40.w,
                                  color: Palette.green.shade700,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.s20(
                              l10n.ahmadMohammadAli,
                              color: Colors.white,
                              bold: true,
                              overflow: true,
                            ),
                            4.verticalSpace,
                            CustomText.s14(
                              l10n.unitOwner,
                              color: Colors.white70,
                            ),
                            8.verticalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: CustomText.s12(
                                'A-402',
                                color: Colors.white,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  16.verticalSpace,
                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('1', l10n.ownedApartments),
                      _buildStatItem('2', l10n.issues),
                      _buildStatItem('3', l10n.serviceRequests),
                    ],
                  ),
                ],
              ),
            ),
            24.verticalSpace,

            // Personal Information Section
            _buildSectionTitle(l10n.personalInfo),
            12.verticalSpace,
            _buildInfoCard([
              _buildInfoItem(Icons.phone, l10n.phoneNumber,
                  l10n.phoneNumberValue, Colors.blue),
              _buildInfoItem(Icons.email, l10n.emailAddress, l10n.emailValue,
                  Colors.green),
              _buildInfoItem(Icons.credit_card, l10n.nationalIdNumber,
                  l10n.nationalIdValue, Colors.purple),
              _buildInfoItem(
                  Icons.cake, l10n.birthDate, l10n.january15, Colors.orange),
            ]),

            24.verticalSpace,

            // Unit Details Section
            _buildSectionTitle(l10n.unitDetails),
            12.verticalSpace,
            _buildInfoCard([
              _buildInfoItem(
                  Icons.home, l10n.unitNumber, l10n.unitValue, Colors.teal),
              _buildInfoItem(Icons.stairs, l10n.floorNumber, l10n.fourthFloor,
                  Colors.indigo),
              _buildInfoItem(Icons.square_foot, l10n.unitArea, l10n.areaValue,
                  Colors.green),
              _buildInfoItem(
                  Icons.location_on, l10n.location, l10n.riyadh, Colors.purple),
              _buildInfoItem(Icons.calendar_today, l10n.handoverDate,
                  l10n.march15, Colors.orange),
            ]),

            24.verticalSpace,

            // Family Members Section
            _buildSectionTitle(l10n.familyMembers),
            12.verticalSpace,
            _buildFamilyMemberCard(l10n.fatimaAhmadAli, l10n.wife, true),
            8.verticalSpace,
            _buildFamilyMemberCard(l10n.mohammadAhmadAli, l10n.sonAge, true),

            24.verticalSpace,

            // Vehicles Section
            _buildSectionTitle(l10n.vehicles),
            12.verticalSpace,
            _buildVehicleCard(l10n.toyotaCamry, l10n.plateNumber1),
            8.verticalSpace,
            _buildVehicleCard(l10n.hondaMotorcycle, l10n.plateNumber2),

            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        CustomText.s24(
          number,
          color: Colors.white,
          bold: true,
        ),
        4.verticalSpace,
        CustomText.s12(
          label,
          color: Colors.white70,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return CustomText.s18(
      title,
      bold: true,
      color: Colors.black87,
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
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
        children: children,
      ),
    );
  }

  Widget _buildInfoItem(
      IconData icon, String label, String value, Color iconColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20.w,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s12(
                  label,
                  color: Colors.grey[600],
                ),
                2.verticalSpace,
                CustomText.s14(
                  value,
                  bold: true,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
          Icon(
            Icons.edit,
            size: 16.w,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyMemberCard(String name, String relation, bool isActive) {
    return Container(
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
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.green.shade100,
            ),
            child: Icon(
              Icons.person,
              color: Palette.green.shade700,
              size: 24.w,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s14(
                  name,
                  bold: true,
                  color: Colors.black87,
                ),
                2.verticalSpace,
                CustomText.s12(
                  relation,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.green.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: CustomText.s10(
              isActive ? 'نشط' : 'غير نشط',
              color: isActive ? Colors.green : Colors.grey,
              bold: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard(String vehicleName, String plateNumber) {
    return Container(
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
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Icon(
              vehicleName.contains('دراجة')
                  ? Icons.motorcycle
                  : Icons.directions_car,
              color: Colors.blue,
              size: 24.w,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s14(
                  vehicleName,
                  bold: true,
                  color: Colors.black87,
                ),
                2.verticalSpace,
                CustomText.s12(
                  plateNumber,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
