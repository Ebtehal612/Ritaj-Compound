import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class AvailableUnitsContent extends StatelessWidget {
  const AvailableUnitsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        // Filter and Sort Bar
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s14(l10n.unitsFound(24),
                  color: Palette.neutral.color7),
              Row(
                children: [
                  CustomText.s14(l10n.sortByPrice,
                      color: Palette.green.shade700),
                  4.horizontalSpace,
                  Icon(Icons.keyboard_arrow_down,
                      size: 18, color: Palette.green.shade700),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              _UnitCard(
                image: 'assets/images/unit_a501.png',
                title: l10n.unit('A-501'),
                subtitle: '${l10n.tower('1')} - ${l10n.floor('5')}',
                price: '2,850,000',
                priceMetter: l10n.pricePerMeter('18,500'),
                rooms: l10n.rooms(3),
                bathrooms: l10n.bathrooms(2),
                area: l10n.area('154'),
                tags: [l10n.gardenView, l10n.corner, l10n.balcony],
                statusTag: l10n.featured,
                statusColor: Colors.amber,
                isAvailable: true,
              ),
              16.verticalSpace,
              _UnitCard(
                image: 'assets/images/unit_b302.png',
                title: l10n.unit('B-302'),
                subtitle: '${l10n.tower('2')} - ${l10n.floor('3')}',
                price: '2,450,000',
                priceMetter: l10n.pricePerMeter('17,200'),
                rooms: l10n.rooms(3),
                bathrooms: l10n.bathrooms(2),
                area: l10n.area('142'),
                tags: [l10n.gardenView],
                statusTag: 'متاح', // Arabic for available as per design
                statusColor: Palette.green.shade700,
                isAvailable: true,
              ),
              16.verticalSpace,
              _UnitCard(
                image: 'assets/images/unit_c201.png',
                title: l10n.unit('A-401'),
                subtitle: '${l10n.tower('1')} - ${l10n.floor('4')}',
                price: '2,750,000',
                rooms: l10n.rooms(3),
                bathrooms: l10n.bathrooms(2),
                area: l10n.area('150'),
                tags: const [],
                statusTag: l10n.sold,
                statusColor: Palette.red.shade500,
                isAvailable: false,
                isSold: true,
              ),
              16.verticalSpace,
              _UnitCard(
                image: 'assets/images/unit_c201.png',
                title: l10n.unit('C-201'),
                subtitle: '${l10n.tower('3')} - ${l10n.floor('2')}',
                price: '3,200,000',
                priceMetter: l10n.pricePerMeter('19,750'),
                rooms: l10n.rooms(4),
                bathrooms: l10n.bathrooms(3),
                area: l10n.area('162'),
                tags: const [],
                statusTag: l10n.reserved,
                statusColor: Palette.orange.shade500,
                isAvailable: false,
                isReserved: true,
                reservationDate: '25 أكتوبر',
              ),
              24.verticalSpace,
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: CustomText.s14(l10n.viewMoreUnits,
                      color: Palette.neutral.color7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UnitCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String? priceMetter;
  final String rooms;
  final String bathrooms;
  final String area;
  final List<String> tags;
  final String statusTag;
  final Color statusColor;
  final bool isAvailable;
  final bool isReserved;
  final bool isSold;
  final String? reservationDate;

  const _UnitCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.priceMetter,
    required this.rooms,
    required this.bathrooms,
    required this.area,
    required this.tags,
    required this.statusTag,
    required this.statusColor,
    this.isAvailable = true,
    this.isReserved = false,
    this.isSold = false,
    this.reservationDate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.asset(
                  image,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Status Badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomText.s12(statusTag,
                      color: Colors.white, bold: true),
                ),
              ),
              // Favorite Button
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isReserved ? Icons.favorite : Icons.favorite_border,
                    color: isReserved ? Colors.red : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              // Sold Overlay
              if (isSold)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r)),
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText.s14(l10n.unitNotAvailable, bold: true),
                            CustomText.s12(l10n.joinWaitingList,
                                color: Palette.neutral.color6),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.s18(title, bold: true),
                    CustomText.s18('$price ${l10n.egp}',
                        bold: true, color: Palette.neutral.color10),
                  ],
                ),
                4.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.s14(subtitle, color: Palette.neutral.color7),
                    if (priceMetter != null)
                      CustomText.s12(priceMetter!,
                          color: Palette.neutral.color6),
                  ],
                ),
                12.verticalSpace,
                // Amenities
                Row(
                  children: [
                    _Amenity(icon: Icons.king_bed_outlined, label: rooms),
                    12.horizontalSpace,
                    _Amenity(icon: Icons.bathtub_outlined, label: bathrooms),
                    12.horizontalSpace,
                    _Amenity(icon: Icons.square_foot, label: area),
                  ],
                ),
                if (tags.isNotEmpty) ...[
                  12.verticalSpace,
                  Wrap(
                    spacing: 8.w,
                    children: tags
                        .map((tag) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Palette.green.shade50,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: CustomText.s10(tag,
                                  color: Palette.green.shade700, bold: true),
                            ))
                        .toList(),
                  ),
                ],

                if (isReserved && reservationDate != null) ...[
                  12.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Palette.orange.shade50,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 16, color: Palette.orange.shade600),
                        8.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.s12(
                                  l10n.reservedUntil(reservationDate!),
                                  color: Palette.orange.shade800,
                                  bold: true),
                              CustomText.s10(l10n.joinWaitingList,
                                  color: Palette.orange.shade700),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                16.verticalSpace,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(Icons.share_outlined, size: 20),
                    ),
                    8.horizontalSpace,
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(Icons.phone_outlined, size: 20),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isSold ? null : () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isReserved
                              ? Palette.orange.shade600
                              : Palette.green.shade700,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: CustomText.s14(
                          isSold
                              ? l10n.waitingList
                              : (isReserved ? l10n.waitingList : l10n.bookNow),
                          color: Colors.white,
                          bold: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Amenity extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Amenity({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Palette.neutral.color7),
        4.horizontalSpace,
        CustomText.s12(label, color: Palette.neutral.color7),
      ],
    );
  }
}
