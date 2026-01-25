import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'groups_tab_content.dart'; // To reuse PostType and PostModel if possible, but let's re-declare to be safe or import if public

class LostTabContent extends StatefulWidget {
  const LostTabContent({super.key});

  @override
  State<LostTabContent> createState() => _LostTabContentState();
}

class _LostTabContentState extends State<LostTabContent> {
  final TextEditingController _postController = TextEditingController();
  final List<PostModel> _posts = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_posts.isEmpty) {
      _initializeMockPosts();
    }
  }

  void _initializeMockPosts() {
    final l10n = AppLocalizations.of(context)!;
    _posts.add(
      PostModel(
        type: PostType.image,
        author: l10n.fatimaMohamed,
        unit: 'C-102',
        time: l10n.sixHoursAgo,
        content: l10n.lostPost,
        imagePath: 'assets/images/lost_cat.png',
        isLost: true,
      ),
    );
  }

  void _addPost() {
    if (_postController.text.trim().isEmpty) return;
    final l10n = AppLocalizations.of(context)!;

    setState(() {
      _posts.insert(
        0,
        PostModel(
          content: _postController.text.trim(),
          author: l10n.you,
          unit: '000',
          time: l10n.now,
        ),
      );
      _postController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: Palette.green.shade700,
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: InputDecoration(
                      hintText: l10n.whatareyoulookingfor,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Palette.neutral.color5,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: Palette.green.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Palette.green.shade700,
                      size: 20.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap: _addPost,
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Palette.green.shade700,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 24.h),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostCard(
                  post: _posts[index],
                  onLike: () {
                    setState(() {
                      _posts[index].isLiked = !_posts[index].isLiked;
                      _posts[index].likes += _posts[index].isLiked ? 1 : -1;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
