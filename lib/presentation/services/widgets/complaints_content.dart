import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class ComplaintsContent extends StatefulWidget {
  const ComplaintsContent({super.key});

  @override
  State<ComplaintsContent> createState() => _ComplaintsContentState();
}

class _ComplaintsContentState extends State<ComplaintsContent> {
  int _selectedFilterIndex = 0; // 0: All, 1: Open, 2: InProgress, 3: Completed

  void _onFilterSelected(int index) {
    setState(() {
      _selectedFilterIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // improved data structure for filtering
    final allComplaints = [
      _ComplaintData(
        id: '#T-2024-001',
        statusKey: 'open',
        statusColor: Palette.red.shade100,
        statusTextColor: Palette.red.shade900,
        title: l10n.electricityOutage,
        description: l10n.electricityOutageDesc,
        date: l10n.sinceTwoDays,
        location: l10n.buildingA,
        category: l10n.facilities,
        hasAttachments: true,
        attachmentCount: 2,
      ),
      _ComplaintData(
        id: '#T-2024-002',
        statusKey: 'inProgress',
        statusColor: Palette.lightBlue.shade100,
        statusTextColor: Palette.lightBlue.shade900,
        title: l10n.lateNoise,
        description: l10n.lateNoiseDesc,
        date: l10n.since3Days,
        location: l10n.buildingA,
        category: l10n.security,
        hasUpdates: true,
        updateTitle: l10n.latestUpdateSecurity,
        updateDesc: l10n.contactedOwner,
        updateTime: l10n.since2Hours,
        hasComments: true,
        commentCount: 3,
      ),
      _ComplaintData(
        id: '#T-2024-003',
        statusKey: 'completed',
        statusColor: Palette.green.shade100,
        statusTextColor: Palette.green.shade900,
        title: l10n.cleanHallways,
        description: l10n.cleanHallwaysDesc,
        date: l10n.sinceWeek,
        location: l10n.buildingA,
        category: l10n.cleanliness,
        isCompleted: true,
        completionTitle: l10n.solvedSuccessfully,
        completionRating: l10n.excellentRate,
        completionFeedback: l10n.fastService,
        solutionTime: l10n.solvedInTwoDays,
      ),
    ];

    List<_ComplaintData> filteredComplaints;
    if (_selectedFilterIndex == 0) {
      filteredComplaints = allComplaints;
    } else if (_selectedFilterIndex == 1) {
      filteredComplaints = allComplaints.where((c) => c.statusKey == 'open').toList();
    } else if (_selectedFilterIndex == 2) {
      filteredComplaints = allComplaints.where((c) => c.statusKey == 'inProgress').toList();
    } else {
      filteredComplaints = allComplaints.where((c) => c.statusKey == 'completed').toList();
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: l10n.open,
                  count: '3',
                  color: Palette.red.shade400, // Changed to red
                  icon: Icons.access_time_filled,
                ),
              ),
              8.horizontalSpace,
              Expanded(
                child: _StatCard(
                  title: l10n.inProgress,
                  count: '2',
                  color: Palette.lightBlue.shade400,
                  icon: Icons.settings,
                ),
              ),
              8.horizontalSpace,
              Expanded(
                child: _StatCard(
                  title: l10n.completed,
                  count: '12',
                  color: Palette.green.shade400,
                  icon: Icons.check_circle,
                  isCompleted: true,
                ),
              ),
            ],
          ),
          24.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: Text(l10n.createNewComplaint),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
          24.verticalSpace,
          _FilterTabs(
            selectedIndex: _selectedFilterIndex,
            onTabSelected: _onFilterSelected,
          ),
          16.verticalSpace,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredComplaints.length,
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemBuilder: (context, index) {
              final data = filteredComplaints[index];
              return _ComplaintCard(
                id: data.id,
                status: _getStatusText(l10n, data.statusKey),
                statusColor: data.statusColor,
                statusTextColor: data.statusTextColor,
                title: data.title,
                description: data.description,
                date: data.date,
                location: data.location,
                category: data.category,
                hasAttachments: data.hasAttachments,
                attachmentCount: data.attachmentCount,
                hasUpdates: data.hasUpdates,
                updateTitle: data.updateTitle,
                updateDesc: data.updateDesc,
                updateTime: data.updateTime,
                hasComments: data.hasComments,
                commentCount: data.commentCount,
                isCompleted: data.isCompleted,
                completionTitle: data.completionTitle,
                completionRating: data.completionRating,
                completionFeedback: data.completionFeedback,
                solutionTime: data.solutionTime,
              );
            },
          ),
        ],
      ),
    );
  }

  String _getStatusText(AppLocalizations l10n, String key) {
    switch (key) {
      case 'open': return l10n.open;
      case 'inProgress': return l10n.inProgress;
      case 'completed': return l10n.completed;
      default: return '';
    }
  }
}

class _ComplaintData {
  final String id;
  final String statusKey;
  final Color statusColor;
  final Color statusTextColor;
  final String title;
  final String description;
  final String date;
  final String location;
  final String category;
  final bool hasAttachments;
  final int attachmentCount;
  final bool hasUpdates;
  final String? updateTitle;
  final String? updateDesc;
  final String? updateTime;
  final bool hasComments;
  final int commentCount;
  final bool isCompleted;
  final String? completionTitle;
  final String? completionRating;
  final String? completionFeedback;
  final String? solutionTime;

  _ComplaintData({
    required this.id,
    required this.statusKey,
    required this.statusColor,
    required this.statusTextColor,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.category,
    this.hasAttachments = false,
    this.attachmentCount = 0,
    this.hasUpdates = false,
    this.updateTitle,
    this.updateDesc,
    this.updateTime,
    this.hasComments = false,
    this.commentCount = 0,
    this.isCompleted = false,
    this.completionTitle,
    this.completionRating,
    this.completionFeedback,
    this.solutionTime,
  });
}

class _StatCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;
  final IconData icon;
  final bool isCompleted;

  const _StatCard({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
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
      child: Column(
        children: [
          Icon(icon, color: color),
          8.verticalSpace,
          CustomText.s20(count, bold: true),
          4.verticalSpace,
          CustomText.s12(title, color: Palette.neutral.color7),
        ],
      ),
    );
  }
}

class _FilterTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const _FilterTabs({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onTabSelected(0),
            child: _TabItem(title: l10n.all, isSelected: selectedIndex == 0),
          ),
          8.horizontalSpace,
          GestureDetector(
            onTap: () => onTabSelected(1),
            child: _TabItem(title: l10n.open, isSelected: selectedIndex == 1),
          ),
          8.horizontalSpace,
          GestureDetector(
            onTap: () => onTabSelected(2),
            child: _TabItem(title: l10n.inProgress, isSelected: selectedIndex == 2),
          ),
          8.horizontalSpace,
          GestureDetector(
            onTap: () => onTabSelected(3),
            child: _TabItem(title: l10n.completed, isSelected: selectedIndex == 3),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _TabItem({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Palette.neutral.color2,
        borderRadius: BorderRadius.circular(8.r),
        border: isSelected ? Border.all(color: Colors.white) : null,
         boxShadow: isSelected ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ] : null,
      ),
      child: CustomText.s14(
        title,
        color: isSelected ? Palette.green.shade700 : Palette.neutral.color7,
        bold: isSelected,
      ),
    );
  }
}

class _ComplaintCard extends StatelessWidget {
  final String id;
  final String status;
  final Color statusColor;
  final Color statusTextColor;
  final String title;
  final String description;
  final String date;
  final String location;
  final String category;
  final bool hasAttachments;
  final int attachmentCount;
  final bool hasUpdates;
  final String? updateTitle;
  final String? updateDesc;
  final String? updateTime;
  final bool hasComments;
  final int commentCount;
  final bool isCompleted;
  final String? completionTitle;
  final String? completionRating;
  final String? completionFeedback;
  final String? solutionTime;

  const _ComplaintCard({
    required this.id,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.category,
    this.hasAttachments = false,
    this.attachmentCount = 0,
    this.hasUpdates = false,
    this.updateTitle,
    this.updateDesc,
    this.updateTime,
    this.hasComments = false,
    this.commentCount = 0,
    this.isCompleted = false,
    this.completionTitle,
    this.completionRating,
    this.completionFeedback,
    this.solutionTime,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: CustomText.s12(status, color: statusTextColor, bold: true),
              ),
              CustomText.s12(id, color: Palette.neutral.color7),
            ],
          ),
          12.verticalSpace,
          CustomText.s16(title, bold: true),
          8.verticalSpace,
          CustomText.s14(description, color: Palette.neutral.color7),
          16.verticalSpace,
          Row(
            children: [
              Icon(Icons.category, size: 16, color: Palette.neutral.color7),
              4.horizontalSpace,
              CustomText.s12(category, color: Palette.neutral.color7),
              16.horizontalSpace,
              Icon(Icons.location_on, size: 16, color: Palette.neutral.color7),
              4.horizontalSpace,
              CustomText.s12(location, color: Palette.neutral.color7),
              16.horizontalSpace,
              Icon(Icons.calendar_today, size: 16, color: Palette.neutral.color7),
              4.horizontalSpace,
              CustomText.s12(date, color: Palette.neutral.color7),
            ],
          ),
          if (hasUpdates && updateTitle != null) ...[
            16.verticalSpace,
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Palette.lightBlue.shade50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, size: 16, color: Palette.lightBlue.shade700),
                      8.horizontalSpace,
                      CustomText.s14(updateTitle!, bold: true, color: Palette.lightBlue.shade700),
                    ],
                  ),
                  8.verticalSpace,
                  CustomText.s12(updateDesc!, color: Palette.lightBlue.shade700),
                  8.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText.s11(updateTime!, color: Palette.lightBlue.shade400),
                    ],
                  ),
                ],
              ),
            ),
          ],
          if (isCompleted) ...[
            16.verticalSpace,
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Palette.green.shade50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      8.horizontalSpace,
                      CustomText.s14(completionTitle!, bold: true, color: Palette.green.shade700),
                    ],
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      CustomText.s12(completionRating!, color: Palette.green.shade700, bold: true),
                      8.horizontalSpace,
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                        ],
                      )
                    ],
                  ),
                  8.verticalSpace,
                  CustomText.s12('"$completionFeedback"', color: Palette.green.shade700),
                ],
              ),
            ),
          ],
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(l10n.viewDetails, style: const TextStyle(color: Colors.teal)),
              ),
              if (hasAttachments)
                Row(
                  children: [
                    const Icon(Icons.attach_file, size: 16, color: Colors.grey),
                    4.horizontalSpace,
                    CustomText.s12(l10n.attachments(attachmentCount), color: Colors.grey),
                  ],
                ),
              if (hasComments)
                Row(
                  children: [
                    const Icon(Icons.comment, size: 16, color: Colors.grey),
                    4.horizontalSpace,
                    CustomText.s12(l10n.comments(commentCount), color: Colors.grey),
                  ],
                ),
              if (isCompleted && solutionTime != null)
                 CustomText.s12(solutionTime!, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
