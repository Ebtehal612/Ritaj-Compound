import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class MallOrderingContent extends StatelessWidget {
  const MallOrderingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.searchForProducts,
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey.shade400),
              ),
            ),
          ),
          24.verticalSpace,

          // Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _CategoryChip(title: l10n.all, isSelected: true),
                8.horizontalSpace,
                _CategoryChip(title: l10n.grocery),
                8.horizontalSpace,
                _CategoryChip(title: l10n.pharmacy),
                8.horizontalSpace,
                _CategoryChip(title: l10n.restaurants),
                8.horizontalSpace,
                _CategoryChip(title: l10n.electronics),
              ],
            ),
          ),
          24.verticalSpace,

          // Featured Offers
          CustomText.s16(l10n.featuredOffers, bold: true),
          12.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade400, Colors.orange.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.discount20,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      8.verticalSpace,
                      CustomText.s14(l10n.onAllGrocery, color: Colors.white),
                      16.verticalSpace,
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: CustomText.s12(l10n.endsIn3Days,
                            color: Colors.orange.shade700, bold: true),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.shopping_basket,
                      color: Colors.white, size: 40),
                ),
              ],
            ),
          ),
          24.verticalSpace,

          // Available Stores
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.s16(l10n.availableStores, bold: true),
            ],
          ),
          16.verticalSpace,

          // Stores List
          _StoreCard(
            title: l10n.goodMarket,
            rating: '4.8',
            tags: '${l10n.grocery} • 15 - 25 ${l10n.minutes}',
            promo: l10n.freeDelivery,
            statusColor: Palette.green.shade700,
            statusText: l10n.open,
            actionText: l10n.shopNow,
            imageColor: Colors.orange.shade100, 
            icon: Icons.storefront,
            actionColor: Palette.green.shade700,
          ),
          16.verticalSpace,
          _StoreCard(
            title: l10n.alNaharPharmacy,
            rating: '4.5',
            tags: '${l10n.pharmacy} • 10 - 20 ${l10n.minutes}',
            promo: l10n.medsAndPrescriptions,
            statusColor: Palette.green.shade700,
            statusText: l10n.open,
            actionText: l10n.shopNow,
            imageColor: Colors.blue.shade700,
            icon: Icons.local_pharmacy,
            actionColor: Palette.green.shade700,
          ),
          16.verticalSpace,
          _StoreCard(
            title: l10n.alAsalaRestaurant,
            rating: '4.9',
            tags: '${l10n.restaurants} • 20 - 30 ${l10n.minutes}',
            promo: l10n.easternWesternFood,
            statusColor: Colors.amber,
            statusText: l10n.busy,
            actionText: l10n.orderNow,
            imageColor: Colors.red.shade100,
            icon: Icons.restaurant,
            actionColor: Palette.green.shade700,
          ),
          16.verticalSpace,
          _StoreCard(
            title: l10n.techStore,
            rating: '4.2',
            tags: '${l10n.electronics} • 30 - 45 ${l10n.minutes}',
            promo: l10n.opensTomorrow,
            statusColor: Colors.red,
            statusText: l10n.closed,
            actionText: l10n.closed,
            imageColor: Colors.grey.shade200,
            icon: Icons.computer,
            actionColor: Colors.grey,
            isClosed: true,
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _CategoryChip({required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? Palette.green.shade700 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CustomText.s14(
        title,
        color: isSelected ? Colors.white : Colors.black,
        bold: isSelected,
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  final String title;
  final String rating;
  final String tags;
  final String promo;
  final Color statusColor;
  final String statusText;
  final String actionText;
  final Color imageColor;
  final IconData icon;
  final Color actionColor;
  final bool isClosed;

  const _StoreCard({
    required this.title,
    required this.rating,
    required this.tags,
    required this.promo,
    required this.statusColor,
    required this.statusText,
    required this.actionText,
    required this.imageColor,
    required this.icon,
    required this.actionColor,
    this.isClosed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: imageColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, size: 40, color: Colors.black54),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: CustomText.s16(title, bold: true)),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: statusColor),
                        4.horizontalSpace,
                        CustomText.s12(statusText, color: statusColor),
                      ],
                    ),
                  ],
                ),
                4.verticalSpace,
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    4.horizontalSpace,
                    CustomText.s12('($rating)'),
                  ],
                ),
                4.verticalSpace,
                CustomText.s12(tags, color: Colors.grey),
                8.verticalSpace,
                CustomText.s12(promo, color: Colors.grey.shade700),
                12.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isClosed ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: actionColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                    child: Text(actionText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
