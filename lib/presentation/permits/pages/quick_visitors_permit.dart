import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';
import 'package:ritaj_compound/presentation/more/pages/more_screen.dart';

class QuickVisitorsPermit extends StatefulWidget {
  static const routeName = '/create-visit-permit';
  const QuickVisitorsPermit({super.key});
  @override
  State<QuickVisitorsPermit> createState() => _QuickVisitorsPermitState();
}

class _QuickVisitorsPermitState extends State<QuickVisitorsPermit> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool multipleEntry = false;
  bool allowVehicle = false;

  String? selectedGate;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios),
          ),
          10.horizontalSpace,
          CustomText.s18(
            l10n.createInvitation,
            bold: true,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.push(MoreScreen.routeName);
              debugPrint('Avatar clicked');
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Palette.green.shade700,
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(l10n.visitorData),
            _inputField(
              label: l10n.visitorName,
              controller: _nameController,
              hint: l10n.enterName,
            ),
            _inputField(
              label: l10n.phoneNumber,
              controller: _phoneController,
              hint: '01012345678',
              keyboardType: TextInputType.phone,
            ),
            20.verticalSpace,
            _sectionTitle(l10n.visitDetails),
            Row(
              children: [
                Expanded(
                  child: _pickerField(
                    label: l10n.time,
                    value: selectedTime.format(context),
                    icon: Icons.access_time,
                    onTap: _pickTime,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: _pickerField(
                    label: l10n.visitDate,
                    value: DateFormat('yyyy-MM-dd').format(selectedDate),
                    icon: Icons.calendar_today,
                    onTap: _pickDate,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            _dropdownField(l10n),
            24.verticalSpace,
            _sectionTitle(l10n.visitOptions),
            _switchTile(
              title: l10n.multipleEntry,
              subtitle: l10n.multipleEntryDescription,
              value: multipleEntry,
              onChanged: (v) => setState(() => multipleEntry = v),
            ),
            _switchTile(
              title: l10n.longTermVisit,
              subtitle: l10n.longTermVisitDescription,
              value: allowVehicle,
              onChanged: (v) => setState(() => allowVehicle = v),
            ),
            20.verticalSpace,
            _sectionTitle(l10n.additionalNotes),
            _notesField(l10n),
            30.verticalSpace,
            _submitButton(l10n),
          ],
        ),
      ),
    );
  }

  // ---------------- Widgets ----------------

  Widget _sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Palette.neutral.color7, fontSize: 14.sp),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  Widget _pickerField({
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 12.sp)),
            6.verticalSpace,
            Row(
              children: [
                Icon(icon, size: 18.w),
                8.horizontalSpace,
                Text(value),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdownField(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(l10n.selectGate),
          value: selectedGate,
          isExpanded: true,
          items: [l10n.mainGate, l10n.gate2, l10n.gate3]
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (v) => setState(() => selectedGate = v),
        ),
      ),
    );
  }

  Widget _switchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Widget _notesField(AppLocalizations l10n) {
    return TextField(
      controller: _notesController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: l10n.visitSpecialNotes,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  Widget _submitButton(AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton.icon(
        onPressed: () {
          final name = _nameController.text.trim();
          final phone = _phoneController.text.trim();

          if (name.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(l10n.pleaseEnterVisitorName),
              ),
            );
            return;
          }

          if (phone.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(l10n.pleaseEnterPhoneNumber),
              ),
            );
            return;
          }

          if (phone.length < 11) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.pleaseEnterValidPhone),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }
          if (selectedTime == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(l10n.pleaseSelectTime),
              ),
            );
            return;
          }
          if (selectedDate.isBefore(
            DateTime.now().subtract(const Duration(days: 1)),
          )) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(l10n.pleaseSelectValidDate),
              ),
            );
            return;
          }

          debugPrint('Name: $name');
          debugPrint('Phone: $phone');
        },
        icon: const Icon(Icons.send, color: Colors.white),
        label: CustomText.s16(l10n.createInvitationButton, color: Colors.white),
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.green.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  // ---------------- Pickers ----------------

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: selectedDate,
    );
    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time != null) {
      setState(() => selectedTime = time);
    }
  }
}
