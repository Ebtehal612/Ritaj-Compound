import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class MedicalServicesContent extends StatefulWidget {
  const MedicalServicesContent({super.key});

  @override
  State<MedicalServicesContent> createState() => _MedicalServicesContentState();
}

class _MedicalServicesContentState extends State<MedicalServicesContent> {
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    // Reset to default category (Doctors) when widget is created
    _selectedCategoryIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Section
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Palette.neutral.color3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: Palette.neutral.color6),
                  10.horizontalSpace,
                  Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: l10n.searchMedical,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                          color: Palette.neutral.color5,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Categories Section

          12.verticalSpace,
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SizedBox(
              height: 100.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  _CategoryItem(
                    icon: Icons.person_search,
                    label: l10n.doctors,
                    color: Palette.lightBlue.shade500,
                    bgColor: Palette.lightBlue.shade50,
                    isSelected: _selectedCategoryIndex == 0,
                    onTap: () => setState(() => _selectedCategoryIndex = 0),
                  ),
                  25.horizontalSpace,
                  _CategoryItem(
                    icon: Icons.local_hospital,
                    label: l10n.clinics,
                    color: Palette.green.shade500,
                    bgColor: Palette.green.shade50,
                    isSelected: _selectedCategoryIndex == 1,
                    onTap: () => setState(() => _selectedCategoryIndex = 1),
                  ),
                  15.horizontalSpace,
                  _CategoryItem(
                    icon: Icons.science,
                    label: l10n.lab,
                    color: Palette.purple.shade500,
                    bgColor: Palette.purple.shade50,
                    isSelected: _selectedCategoryIndex == 2,
                    onTap: () => setState(() => _selectedCategoryIndex = 2),
                  ),
                  15.horizontalSpace,
                  _CategoryItem(
                    icon: Icons.medical_services,
                    label: l10n.pharmacies,
                    color: Palette.orange.shade500,
                    bgColor: Palette.orange.shade50,
                    isSelected: _selectedCategoryIndex == 3,
                    onTap: () => setState(() => _selectedCategoryIndex = 3),
                  ),
                ],
              ),
            ),
          ),

          24.verticalSpace,

          // Dynamic Content based on selection
          if (_selectedCategoryIndex == 0) _buildDoctorsList(l10n),
          if (_selectedCategoryIndex == 1)
            _buildSection(l10n.clinics, _getClinics(l10n)),
          if (_selectedCategoryIndex == 2)
            _buildSection(l10n.lab, _getLabs(l10n)),
          if (_selectedCategoryIndex == 3)
            _buildSection(l10n.pharmacies, _getPharmacies(l10n)),

          24.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildDoctorsList(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s16(l10n.topDoctors, bold: true),
            ],
          ),
        ),
        8.verticalSpace,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: 3,
          itemBuilder: (context, index) {
            const doctors = [
              {
                'name': 'Dr. Mohamed Ahmed',
                'specialty': 'specialtyCardio',
                'rating': '4.8',
                'reviews': '120',
                'distance': '1.5',
              },
              {
                'name': 'Dr. Sara Yassin',
                'specialty': 'specialtyPediatrics',
                'rating': '4.9',
                'reviews': '85',
                'distance': '2.3',
              },
              {
                'name': 'Dr. Noha Khalid',
                'specialty': 'specialtyDento',
                'rating': '4.7',
                'reviews': '210',
                'distance': '0.8',
              },
            ];
            final doc = doctors[index];
            final specialtyKey = doc['specialty']!;
            String localizedSpecialty = '';
            if (specialtyKey == 'specialtyCardio') {
              localizedSpecialty = l10n.specialtyCardio;
            }
            if (specialtyKey == 'specialtyPediatrics') {
              localizedSpecialty = l10n.specialtyPediatrics;
            }
            if (specialtyKey == 'specialtyDento') {
              localizedSpecialty = l10n.specialtyDento;
            }

            return _DoctorCard(
              name: doc['name']!,
              specialty: localizedSpecialty,
              rating: doc['rating']!,
              reviews: doc['reviews']!,
              distance: doc['distance']!,
              image: doc['name'] == 'Dr. Mohamed Ahmed'
                  ? 'assets/images/doctor_male.png'
                  : 'assets/images/doctor_female.png',
            );
          },
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> items) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s16(title, bold: true),
            ],
          ),
        ),
        8.verticalSpace,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            String? imagePath;
            if (item['name'] == 'Speed Medical Lab') {
              imagePath = 'assets/images/medical_lab.png';
            } else if (title == l10n.pharmacies) {
              imagePath = 'assets/images/doctor_female.png';
            }
            // Also adding doctor images just in case they were missed/reverted
            return _DoctorCard(
              name: item['name']!,
              specialty: item['address']!,
              rating: item['rating']!,
              reviews: item['reviews']!,
              distance: item['distance']!,
              isClinic: true,
              image: imagePath,
            );
          },
        ),
      ],
    );
  }

  List<Map<String, String>> _getClinics(AppLocalizations l10n) {
    return [
      {
        'name': 'Ritaj Dental Care',
        'address': 'Building A, Unit 105',
        'rating': '4.9',
        'reviews': '45',
        'distance': '0.2',
      },
      {
        'name': 'Healthy Heart Clinic',
        'address': 'Building C, Unit 202',
        'rating': '4.7',
        'reviews': '28',
        'distance': '0.5',
      },
    ];
  }

  List<Map<String, String>> _getLabs(AppLocalizations l10n) {
    return [
      {
        'name': 'Speed Medical Lab',
        'address': 'Building Mall, Floor 1',
        'rating': '4.8',
        'reviews': '150',
        'distance': '0.3',
      },
      {
        'name': 'Scan & Care',
        'address': 'Building B, Ground Floor',
        'rating': '4.6',
        'reviews': '60',
        'distance': '0.6',
      },
    ];
  }

  List<Map<String, String>> _getPharmacies(AppLocalizations l10n) {
    return [
      {
        'name': 'El-Ezaby Pharmacy',
        'address': 'Compound Main Entrance',
        'rating': '4.9',
        'reviews': '500',
        'distance': '0.1',
      },
      {
        'name': 'Care Pharmacy',
        'address': 'Beside Mall Entrance',
        'rating': '4.5',
        'reviews': '120',
        'distance': '0.4',
      },
    ];
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color bgColor;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.bgColor,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: isSelected ? color : bgColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected ? color : Colors.transparent,
                width: 2,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : color,
              size: 28,
            ),
          ),
          8.verticalSpace,
          CustomText.s12(
            label,
            bold: true,
            color: isSelected ? color : Palette.neutral.color10,
          ),
        ],
      ),
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String rating;
  final String reviews;
  final String distance;
  final bool isClinic;
  final String? image;

  const _DoctorCard({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.distance,
    this.isClinic = false,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Themed styling based on isClinic (or eventually a proper type)
    final themeColor =
        isClinic ? Palette.green.shade500 : Palette.lightBlue.shade500;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: themeColor.withValues(alpha: 0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: themeColor.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Image Section (Right in RTL / First in Code)
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: themeColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: image != null
                  ? (image!.startsWith('http')
                      ? CachedNetworkImage(
                          imageUrl: image!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: themeColor,
                              strokeWidth: 2,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            isClinic ? Icons.local_hospital : Icons.person,
                            size: 32,
                            color: themeColor,
                          ),
                        )
                      : Image.asset(
                          image!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            isClinic ? Icons.local_hospital : Icons.person,
                            size: 32,
                            color: themeColor,
                          ),
                        ))
                  : Icon(
                      isClinic ? Icons.local_hospital : Icons.person,
                      size: 32,
                      color: themeColor,
                    ),
            ),
          ),

          10.horizontalSpace,

          // 2. Info Section (Middle, Flexible)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText.s16(name, bold: true, overflow: true),
                CustomText.s12(specialty,
                    color: Palette.neutral.color7, overflow: true),
                6.verticalSpace,
                // Chips for Rating and Distance (Wrap prevents horizontal overflow)
                Wrap(
                  spacing: 4.w,
                  runSpacing: 4.h,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 10),
                          2.horizontalSpace,
                          CustomText.s10(l10n.rating(rating, reviews),
                              bold: true, color: Colors.amber[900]!),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Palette.green.shade50,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.location_on,
                              color: Palette.green.shade500, size: 10),
                          2.horizontalSpace,
                          CustomText.s10(l10n.distance(distance),
                              color: Palette.neutral.color7, bold: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          8.horizontalSpace,

          // 3. Action Button (Left in RTL / Last in Code)
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.green.shade500,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: CustomText.s12(l10n.bookSelection,
                color: Colors.white, bold: true),
          ),
        ],
      ),
    );
  }
}
