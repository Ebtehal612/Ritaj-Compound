import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

class QuickDeliveryPermit extends StatefulWidget {
  static const routeName = '/create-delivery-permit';
  const QuickDeliveryPermit({super.key});
  @override
  State<QuickDeliveryPermit> createState() => _QuickDeliveryPermitState();
}

class _QuickDeliveryPermitState extends State<QuickDeliveryPermit> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool multipleEntry = false;
  bool allowVehicle = false;

  String? selectedGate;

  int? expectedArrivalMinutes;

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
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Palette.green.shade700,
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(l10n.entityData),
            _inputField(
              label: l10n.entityName,
              controller: _nameController,
              hint: l10n.enterName,
            ),
            _inputField(
              label: l10n.phoneNumberOptional,
              controller: _phoneController,
              hint: '01012345678',
              keyboardType: TextInputType.phone,
            ),
            20.verticalSpace,
            _sectionTitle(l10n.details),
            Row(
              children: [
                Expanded(child: _arrivalDurationField(l10n)),
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

  Widget _arrivalDurationField(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          hint: Text(l10n.expectedArrivalWithin),
          style: TextStyle(fontSize: 14.sp, color: Colors.black),
          value: expectedArrivalMinutes,
          isExpanded: true,
          items: [
            DropdownMenuItem(value: 15, child: Text(l10n.fifteenMinutes)),
            DropdownMenuItem(value: 30, child: Text(l10n.thirtyMinutes)),
            DropdownMenuItem(value: 45, child: Text(l10n.fortyFiveMinutes)),
            DropdownMenuItem(value: 60, child: Text(l10n.sixtyMinutes)),
          ],
          onChanged: (v) => setState(() => expectedArrivalMinutes = v),
        ),
      ),
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
          final notes = _notesController.text.trim();

          if (name.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(l10n.pleaseEnterEntityName),
              ),
            );
            return;
          }

          if (phone.isNotEmpty && phone.length < 11) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(l10n.pleaseEnterValidPhone),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }
          if (expectedArrivalMinutes == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(l10n.pleaseSelectArrivalTime),
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
          debugPrint('Notes: $notes');
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
}
