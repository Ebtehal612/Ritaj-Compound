import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios),
          ),
          10.horizontalSpace,
          CustomText.s18(
            "إنشاء دعوة",
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
            _sectionTitle('بيانات الجهة'),
            _inputField(
              label: 'اسم الجهة',
              controller: _nameController,
              hint: 'أدخل الاسم',
            ),
            _inputField(
              label: '  رقم الهاتف - اختياري',
              controller: _phoneController,
              hint: '01012345678',
              keyboardType: TextInputType.phone,
            ),
            20.verticalSpace,
            _sectionTitle('تفاصيل '),
            Row(
              children: [
                Expanded(child: _arrivalDurationField()),
                12.horizontalSpace,
                Expanded(
                  child: _pickerField(
                    label: 'تاريخ الزيارة',
                    value: DateFormat('yyyy-MM-dd').format(selectedDate),
                    icon: Icons.calendar_today,
                    onTap: _pickDate,
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            _dropdownField(),
            20.verticalSpace,
            _sectionTitle('ملاحظات إضافية'),
            _notesField(),
            30.verticalSpace,
            _submitButton(),
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

  Widget _dropdownField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text('اختر البوابة'),
          value: selectedGate,
          isExpanded: true,
          items: ['البوابة الرئيسية', 'بوابة 2', 'بوابة 3']
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

  Widget _arrivalDurationField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          hint: const Text('الوصول المتوقع خلال'),
          style: TextStyle(fontSize: 14.sp, color: Colors.black),
          value: expectedArrivalMinutes,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 15, child: Text('15 دقيقة')),
            DropdownMenuItem(value: 30, child: Text('30 دقيقة')),
            DropdownMenuItem(value: 45, child: Text('45 دقيقة')),
            DropdownMenuItem(value: 60, child: Text('60 دقيقة')),
          ],
          onChanged: (v) => setState(() => expectedArrivalMinutes = v),
        ),
      ),
    );
  }

  Widget _notesField() {
    return TextField(
      controller: _notesController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'أي ملاحظات خاصة بالزيارة',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  Widget _submitButton() {
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
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('من فضلك أدخل اسم الجهة'),
              ),
            );
            return;
          }

          if (phone.isNotEmpty && phone.length < 11) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('من فضلك أدخل رقم هاتف صحيح'),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }
          if (expectedArrivalMinutes == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('من فضلك اختر وقت الوصول المتوقع'),
              ),
            );
            return;
          }
          if (selectedDate.isBefore(
            DateTime.now().subtract(const Duration(days: 1)),
          )) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('من فضلك اختر تاريخ '),
              ),
            );
            return;
          }
          debugPrint('Name: $name');
          debugPrint('Phone: $phone');
          debugPrint('Notes: $notes');
        },
        icon: const Icon(Icons.send, color: Colors.white),
        label: CustomText.s16('إنشاء الدعوة', color: Colors.white),
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
