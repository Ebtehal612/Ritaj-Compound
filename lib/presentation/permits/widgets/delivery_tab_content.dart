import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/states/base_state.dart';
import 'package:ritaj_compound/domain/permits/entities/delivery_permit.dart';
import 'package:ritaj_compound/presentation/permits/cubit/deliveries_cubit.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/permits/pages/quick_delivery_permit.dart';
import 'package:intl/intl.dart';

class DeliveryTabContent extends StatelessWidget {
  const DeliveryTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return RefreshIndicator(
      onRefresh: () => context.read<DeliveriesCubit>().getActiveDeliveries(),
      color: Palette.green.shade700,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _QuickDeliveryPermitCard(),
            24.verticalSpace,
            _ActiveDeliveriesSection(),
            24.verticalSpace,
            _PreviousDeliveriesSection(),
          ],
        ),
      ),
    );
  }
}

class _ActiveDeliveriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<DeliveriesCubit, BaseState<List<DeliveryPermit>>>(
      builder: (context, state) {
        if (kDebugMode) {
          print(
              '🎯 DeliveryTabContent: BlocBuilder received state: ${state.runtimeType}');
        }

        final cubit = context.read<DeliveriesCubit>();
        final List<DeliveryPermit> deliveries = cubit.activeDeliveries;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText.s16(l10n.activeDeliveries, bold: true),
                if (deliveries.isNotEmpty) ...[
                  8.horizontalSpace,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: Palette.green.shade50,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: CustomText.s12(
                      deliveries.length.toString(),
                      color: Palette.green.shade700,
                    ),
                  ),
                ],
              ],
            ),
            16.verticalSpace,
            state.maybeWhen(
              loading: () => deliveries.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Palette.green.shade700,
                    ))
                  : _buildList(deliveries, context),
              success: (_) => deliveries.isEmpty
                  ? _buildEmpty(l10n)
                  : _buildList(deliveries, context),
              empty: () => _buildEmpty(l10n),
              failure: (f) => deliveries.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomText.s14(f.message, color: Colors.red),
                      ),
                    )
                  : _buildList(deliveries, context),
              orElse: () => deliveries.isEmpty
                  ? _buildEmpty(l10n)
                  : _buildList(deliveries, context),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmpty(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child:
            CustomText.s14(l10n.noActivePermits, color: Palette.neutral.color5),
      ),
    );
  }

  Widget _buildList(List<DeliveryPermit> deliveries, BuildContext context) {
    if (kDebugMode) {
      print(
          '🎯 _buildList: Building list with ${deliveries.length} deliveries');
      for (int i = 0; i < deliveries.length; i++) {
        final delivery = deliveries[i];
        print('🎯 Delivery $i:');
        print('  - ID: "${delivery.id}"');
        print('  - Name: "${delivery.name}"');
        print('  - Phone: "${delivery.phone}"');
        print('  - Expected Arrival: "${delivery.expectedArrival} "');
        print('  - Gate: "${delivery.gate}"');
        print('  - Date: ${delivery.date}');
      }
    }

    return Column(
      children: deliveries
          .map((delivery) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: _ActiveDeliveryCard(
                  id: delivery.id,
                  deliveryName: delivery.name,
                  phone: delivery.phone,
                  gate: delivery.gate,
                  expectedArrival: delivery.expectedArrival,
                  date: delivery.date,
                  onCancel: () {
                    if (kDebugMode) {
                      print(
                          '🗑️ UI: Cancel button pressed for delivery ${delivery.id}');
                    }
                    context
                        .read<DeliveriesCubit>()
                        .deleteDeliveryPermit(delivery.id);
                  },
                ),
              ))
          .toList(),
    );
  }
}

class _QuickDeliveryPermitCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 343.w,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Palette.green.shade700,
              Palette.green.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText.s20(
              l10n.createQuickPermit,
              color: Colors.white,
              bold: true,
            ),
            16.verticalSpace,
            SizedBox(
              width: 295.w,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.push(QuickDeliveryPermit.routeName);
                },
                icon: const Icon(
                  Icons.delivery_dining,
                  size: 25,
                ),
                label: Text(l10n.newDeliveryPermit),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  side: const BorderSide(color: Colors.white, width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActiveDeliveryCard extends StatelessWidget {
  final String id;
  final String deliveryName;
  final String phone;
  final String? gate;
  final String expectedArrival;
  final DateTime date;
  final VoidCallback? onCancel;

  const _ActiveDeliveryCard({
    required this.id,
    required this.deliveryName,
    required this.phone,
    required this.expectedArrival,
    required this.date,
    this.gate,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Palette.green.shade50,
                  child: Icon(
                    Icons.local_shipping,
                    color: Palette.green.shade400,
                  ),
                ),
                12.horizontalSpace,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.s15(deliveryName, bold: true),
                      Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: CustomText.s12(phone,
                              color: Palette.neutral.color7)),
                    ],
                  ),
                ),
                12.horizontalSpace,
                const Spacer(),
                const Icon(Icons.qr_code_scanner, color: Colors.teal, size: 20),
                12.horizontalSpace,
                const Icon(Icons.share, color: Colors.blueGrey, size: 20),
              ],
            ),
            const Divider(),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s12(l10n.expectedArrival,
                        color: Palette.neutral.color7),
                    Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: Directionality(
                        textDirection: ui.TextDirection.ltr,
                        child: CustomText.s14(
                            ' $expectedArrival - ${DateFormat('dd MMM').format(date)}',
                            bold: true),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s12(l10n.entrancegate,
                        color: Palette.neutral.color7),
                    CustomText.s14(
                      (gate == null || gate!.isEmpty) ? l10n.mainGate : gate!,
                      bold: true,
                    ),
                  ],
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      minimumSize: Size.zero,
                      side: const BorderSide(
                        color: Colors.red,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: CustomText.s12(
                      l10n.cancelthepermit,
                      color: Colors.red,
                      bold: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviousDeliveriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<DeliveriesCubit, BaseState<List<DeliveryPermit>>>(
      builder: (context, state) {
        final deliveriesCubit = context.read<DeliveriesCubit>();
        final previousDeliveries = deliveriesCubit.previousDeliveries;

        if (kDebugMode && previousDeliveries.isNotEmpty) {
          print(
              '🎯 PreviousDeliveriesSection: ${previousDeliveries.length} previous deliveries');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.s16(l10n.previousDeliveries, bold: true),
            16.verticalSpace,
            if (previousDeliveries.isEmpty)
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: CustomText.s14(l10n.noPreviousDeliveries,
                      color: Palette.neutral.color5),
                ),
              )
            else
              ...previousDeliveries.take(5).map((delivery) =>
                  _PreviousDeliveryItem(
                    id: delivery.id,
                    name: delivery.name,
                    time: DateFormat('dd MMM').format(delivery.date),
                    onDelete: () {
                      if (kDebugMode) {
                        print('🗑️ UI: Delete previous visitor ${delivery.id}');
                      }
                      context
                          .read<DeliveriesCubit>()
                          .deleteDeliveryPermit(delivery.id);
                    },
                    onInvite: () {
                      if (kDebugMode) {
                        print(
                            '🔄 UI: Invite again for delivery ${delivery.name}');
                      }
                      // Navigate to create delivery permit page with pre-filled data
                      context.push(
                        QuickDeliveryPermit.routeName,
                        extra:
                            delivery, // Pass the delivery data to pre-fill the form
                      );
                    },
                  )),
          ],
        );
      },
    );
  }
}

class _PreviousDeliveryItem extends StatelessWidget {
  final String id;
  final String name;
  final String time;
  final VoidCallback? onInvite;
  final VoidCallback? onDelete;

  const _PreviousDeliveryItem({
    required this.id,
    required this.name,
    required this.time,
    this.onDelete,
    this.onInvite,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Palette.neutral.color3,
            child: const Icon(Icons.local_shipping, color: Colors.grey),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.s14(name, bold: true, color: Palette.neutral.color7),
                CustomText.s12(time, color: Palette.neutral.color7),
              ],
            ),
          ),
          TextButton(
            onPressed: onInvite,
            child: Text(
              l10n.inviteAgain,
              style: const TextStyle(color: Colors.teal),
            ),
          ),
          if (onDelete != null) ...[
            8.horizontalSpace,
            IconButton(
              onPressed: onDelete,
              icon:
                  const Icon(Icons.delete_outline, color: Colors.red, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ]),
      ),
    );
  }
}
