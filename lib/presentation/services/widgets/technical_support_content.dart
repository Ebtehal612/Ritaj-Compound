import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class TechnicalSupportContent extends StatefulWidget {
  const TechnicalSupportContent({super.key});

  @override
  State<TechnicalSupportContent> createState() =>
      _TechnicalSupportContentState();
}

class _TechnicalSupportContentState extends State<TechnicalSupportContent> {
  final Set<int> _expandedCategories = {};

  @override
  void initState() {
    super.initState();
    // Reset to default state (all categories collapsed) when widget is created
    _expandedCategories.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Electrician Category
          _ExpandableCategory(
            categoryIndex: 0,
            title: l10n.electrician,
            icon: Icons.electrical_services,
            color: Colors.white,
            isExpanded: _expandedCategories.contains(0),
            onToggle: () => _toggleCategory(0),
            technicians: _getElectricians(),
            themeColor: Palette.orange.shade500,
          ),
          20.verticalSpace,

          // Plumber Category
          _ExpandableCategory(
            categoryIndex: 1,
            title: l10n.plumber,
            icon: Icons.plumbing,
            color: Colors.white,
            isExpanded: _expandedCategories.contains(1),
            onToggle: () => _toggleCategory(1),
            technicians: _getPlumbers(),
            themeColor: Palette.lightBlue.shade500,
          ),
          20.verticalSpace,

          // Carpenter Category
          _ExpandableCategory(
            categoryIndex: 2,
            title: l10n.carpenter,
            icon: Icons.carpenter,
            color: Colors.white,
            isExpanded: _expandedCategories.contains(2),
            onToggle: () => _toggleCategory(2),
            technicians: _getCarpenters(),
            themeColor: Palette.orange.shade700,
          ),
          20.verticalSpace,

          // AC Technician Category
          _ExpandableCategory(
            categoryIndex: 3,
            title: l10n.acTechnician,
            icon: Icons.ac_unit,
            color: Colors.white,
            isExpanded: _expandedCategories.contains(3),
            onToggle: () => _toggleCategory(3),
            technicians: _getACTechnicians(),
            themeColor: Palette.fayrouz.shade500,
          ),
          20.verticalSpace,

          // Painter Category
          _ExpandableCategory(
            categoryIndex: 4,
            title: l10n.painter,
            icon: Icons.format_paint,
            color: Colors.white,
            isExpanded: _expandedCategories.contains(4),
            onToggle: () => _toggleCategory(4),
            technicians: _getPainters(),
            themeColor: Palette.purple.shade500,
          ),
        ],
      ),
    );
  }

  void _toggleCategory(int index) {
    setState(() {
      if (_expandedCategories.contains(index)) {
        _expandedCategories.remove(index);
      } else {
        _expandedCategories.add(index);
      }
    });
  }

  List<Map<String, String>> _getElectricians() {
    return [
      {
        'name': 'Ahmed Hassan',
        'specialty': 'Electrical Installations',
        'rating': '4.9',
        'reviews': '156',
        'distance': '0.5',
      },
      {
        'name': 'Mohamed Ali',
        'specialty': 'Home Wiring Expert',
        'rating': '4.7',
        'reviews': '89',
        'distance': '1.2',
      },
    ];
  }

  List<Map<String, String>> _getPlumbers() {
    return [
      {
        'name': 'Khaled Ibrahim',
        'specialty': 'Plumbing & Drainage',
        'rating': '4.8',
        'reviews': '124',
        'distance': '0.8',
      },
      {
        'name': 'Yasser Mahmoud',
        'specialty': 'Water Systems',
        'rating': '4.6',
        'reviews': '67',
        'distance': '1.5',
      },
    ];
  }

  List<Map<String, String>> _getCarpenters() {
    return [
      {
        'name': 'Tarek Samir',
        'specialty': 'Furniture & Cabinets',
        'rating': '4.9',
        'reviews': '203',
        'distance': '0.3',
      },
      {
        'name': 'Omar Fathy',
        'specialty': 'Custom Woodwork',
        'rating': '4.8',
        'reviews': '145',
        'distance': '0.9',
      },
    ];
  }

  List<Map<String, String>> _getACTechnicians() {
    return [
      {
        'name': 'Hassan Nabil',
        'specialty': 'AC Installation & Repair',
        'rating': '4.9',
        'reviews': '178',
        'distance': '0.6',
      },
      {
        'name': 'Amr Sayed',
        'specialty': 'HVAC Specialist',
        'rating': '4.7',
        'reviews': '92',
        'distance': '1.1',
      },
    ];
  }

  List<Map<String, String>> _getPainters() {
    return [
      {
        'name': 'Mahmoud Adel',
        'specialty': 'Interior Painting',
        'rating': '4.8',
        'reviews': '134',
        'distance': '0.4',
      },
      {
        'name': 'Sherif Kamal',
        'specialty': 'Decorative Finishes',
        'rating': '4.6',
        'reviews': '78',
        'distance': '1.3',
      },
    ];
  }
}

class _ExpandableCategory extends StatelessWidget {
  final int categoryIndex;
  final String title;
  final IconData icon;
  final Color color;
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<Map<String, String>> technicians;
  final Color themeColor;

  const _ExpandableCategory({
    required this.categoryIndex,
    required this.title,
    required this.icon,
    required this.color,
    required this.isExpanded,
    required this.onToggle,
    required this.technicians,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Header
        GestureDetector(
          onTap: onToggle,
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.25),
                  blurRadius: 16,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: themeColor,
                  size: 32,
                ),
                16.horizontalSpace,
                Expanded(
                  child: CustomText.s18(
                    title,
                    bold: true,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: themeColor,
                  size: 28,
                ),
              ],
            ),
          ),
        ),

        // Expanded Technician List
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: color.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              children: technicians.asMap().entries.map((entry) {
                final index = entry.key;
                final tech = entry.value;
                return Column(
                  children: [
                    _TechnicianCard(
                      name: tech['name']!,
                      specialty: tech['specialty']!,
                      rating: tech['rating']!,
                      reviews: tech['reviews']!,
                      distance: tech['distance']!,
                      themeColor: themeColor,
                    ),
                    if (index < technicians.length - 1)
                      Divider(
                        height: 1,
                        color: Palette.neutral.color3,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}

class _TechnicianCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String rating;
  final String reviews;
  final String distance;
  final Color themeColor;
  final String? imageUrl;

  const _TechnicianCard({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.themeColor,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.all(12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Section
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: themeColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: imageUrl != null
                  ? (imageUrl!.startsWith('http')
                      ? CachedNetworkImage(
                          imageUrl: imageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: themeColor,
                              strokeWidth: 2,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.engineering,
                            size: 28,
                            color: themeColor,
                          ),
                        )
                      : Image.asset(
                          imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.engineering,
                            size: 28,
                            color: themeColor,
                          ),
                        ))
                  : Icon(
                      Icons.engineering,
                      size: 28,
                      color: themeColor,
                    ),
            ),
          ),

          12.horizontalSpace,

          // Info Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText.s14(name, bold: true, overflow: true),
                CustomText.s11(specialty,
                    color: Palette.neutral.color7, overflow: true),
                4.verticalSpace,
                Wrap(
                  spacing: 4.w,
                  runSpacing: 2.h,
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

          // Action Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Palette.green.shade500,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: CustomText.s11(l10n.bookService,
                color: Colors.white, bold: true),
          ),
        ],
      ),
    );
  }
}
