import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/permits/pages/quick_visitors_permit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritaj_compound/core/states/base_state.dart';
import 'package:ritaj_compound/domain/permits/entities/visitor_permit.dart';
import 'package:ritaj_compound/presentation/permits/cubit/visitors_cubit.dart';
import 'package:intl/intl.dart';

class VisitorsTabContent extends StatelessWidget {
  const VisitorsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return RefreshIndicator(
      onRefresh: () => context.read<VisitorsCubit>().getActivePermits(),
      color: Palette.green.shade700,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _QuickPermitCard(),
            24.verticalSpace,
            _ActivePermitsSection(),
            24.verticalSpace,
            _PreviousVisitorsSection(),
          ],
        ),
      ),
    );
  }
}

class _ActivePermitsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<VisitorsCubit, BaseState<List<VisitorPermit>>>(
      builder: (context, state) {
        if (kDebugMode) {
          print('🎯 VisitorsTabContent: BlocBuilder received state: ${state.runtimeType}');
        }
        
        final cubit = context.read<VisitorsCubit>();
        final List<VisitorPermit> permits = cubit.activePermits;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText.s16(l10n.activePermits, bold: true),
                if (permits.isNotEmpty) ...[
                  8.horizontalSpace,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: Palette.green.shade50,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: CustomText.s12(
                      permits.length.toString(),
                      color: Palette.green.shade700,
                    ),
                  ),
                ],
              ],
            ),
            16.verticalSpace,
            state.maybeWhen(
              loading: () => permits.isEmpty
                  ? Center(child: CircularProgressIndicator(color: Palette.green.shade700,))
                  : _buildList(permits, context),
              success: (_) =>
                  permits.isEmpty ? _buildEmpty(l10n) : _buildList(permits, context),
              empty: () => _buildEmpty(l10n),
              failure: (f) => permits.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomText.s14(f.message, color: Colors.red),
                      ),
                    )
                  : _buildList(permits, context),
              orElse: () => permits.isEmpty
                  ? _buildEmpty(l10n)
                  : _buildList(permits, context),
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

  Widget _buildList(List<VisitorPermit> permits, BuildContext context) {
    if (kDebugMode) {
      print('🎯 _buildList: Building list with ${permits.length} permits');
      for (int i = 0; i < permits.length; i++) {
        final permit = permits[i];
        print('🎯 Permit $i:');
        print('  - ID: "${permit.id}"');
        print('  - Name: "${permit.name}"');
        print('  - Phone: "${permit.phone}"');
        print('  - Time: "${permit.time}"');
        print('  - Gate: "${permit.gate}"');
        print('  - Date: ${permit.date}');
      }
    }
    
    return Column(
      children: permits
          .map((permit) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: _ActivePermitCard(
                  id: permit.id,
                  visitorName: permit.name,
                  phone: permit.phone,
                  gate: permit.gate,
                  time: permit.time,
                  date: permit.date,
                  onCancel: () {
                    if (kDebugMode) {
                      print('🗑️ UI: Cancel button pressed for permit ${permit.id}');
                    }
                    context.read<VisitorsCubit>().deleteVisitorPermit(permit.id);
                  },
                ),
              ))
          .toList(),
    );
  }
}

class _PreviousVisitorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocBuilder<VisitorsCubit, BaseState<List<VisitorPermit>>>(
      builder: (context, state) {
        final permitsCubit = context.read<VisitorsCubit>();
        final previousPermits = permitsCubit.previousPermits;
        
        if (kDebugMode && previousPermits.isNotEmpty) {
          print('🎯 PreviousVisitorsSection: ${previousPermits.length} previous permits');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.s16(l10n.previousVisitors, bold: true),
            16.verticalSpace,
            if (previousPermits.isEmpty)
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: CustomText.s14(
                    l10n.noPreviousVisitors,
                    color: Palette.neutral.color5,
                  ),
                ),
              )
            else
              ...previousPermits.take(5).map((permit) => _PreviousVisitorItem(
                id: permit.id,
                name: permit.name,
                time: _formatPreviousVisitTime(permit.date, l10n),
                onDelete: () {
                  if (kDebugMode) {
                    print('🗑️ UI: Delete previous visitor ${permit.id}');
                  }
                  context.read<VisitorsCubit>().deleteVisitorPermit(permit.id);
                },
              )),
          ],
        );
      },
    );
  }

  String _formatPreviousVisitTime(DateTime date, AppLocalizations l10n) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    
    if (difference == 1) {
      return '${l10n.yesterday} ${DateFormat('HH:mm').format(date)}';
    } else if (difference < 7) {
      return '${difference} ${difference == 1 ? 'day' : 'days'} ago';
    } else if (difference < 30) {
      final weeks = (difference / 7).floor();
      return '${weeks} ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else {
      return DateFormat('MMM dd, yyyy').format(date);
    }
  }
}

class _QuickPermitCard extends StatelessWidget {
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
                  context.push(QuickVisitorsPermit.routeName);
                },
                icon: const Icon(
                  Icons.person_add_alt_1,
                  size: 25,
                ),
                label: Text(l10n.newVisitorPermit),
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

class _ActivePermitCard extends StatelessWidget {
  final String id;
  final String visitorName;
  final String phone;
  final String? gate;
  final String time;
  final DateTime date;
  final VoidCallback? onCancel;

  const _ActivePermitCard({
    required this.id,
    required this.visitorName,
    required this.phone,
    required this.time,
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
                    Icons.person,
                    color: Palette.green.shade400,
                  ),
                ),
                12.horizontalSpace,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.s15(visitorName, bold: true),
                      Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: CustomText.s12(phone,
                              color: Palette.neutral.color7)),
                    ],
                  ),
                ),
                75.horizontalSpace,
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
                    CustomText.s12(l10n.datetime,
                        color: Palette.neutral.color7),
                        Directionality( textDirection: ui.TextDirection.ltr, child: CustomText.s14('$time - ${DateFormat('MMM dd').format(date)}' , bold: true)),
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

class _PreviousVisitorItem extends StatelessWidget {
  final String id;
  final String name;
  final String time;
  final VoidCallback? onDelete;

  const _PreviousVisitorItem({
    required this.id,
    required this.name, 
    required this.time,
    this.onDelete,
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
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Palette.neutral.color3,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.s14(name,
                      bold: true, color: Palette.neutral.color7),
                  CustomText.s12(time, color: Palette.neutral.color7),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                l10n.inviteAgain,
                style: const TextStyle(color: Colors.teal),
              ),
            ),
            if (onDelete != null) ...[
              8.horizontalSpace,
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}