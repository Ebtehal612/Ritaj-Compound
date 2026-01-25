import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritaj_compound/core/localization/app_localizations.dart';
import 'package:ritaj_compound/core/theme/palette.dart';
import 'package:ritaj_compound/core/widgets/text/custom_text.dart';

enum PostType { text, poll, image, sale }

class GroupsTabContent extends StatefulWidget {
  const GroupsTabContent({super.key});

  @override
  State<GroupsTabContent> createState() => _GroupsTabContentState();
}

class _GroupsTabContentState extends State<GroupsTabContent> {
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
    _posts.addAll([
      PostModel(
        type: PostType.poll,
        author: l10n.sarahAhmed,
        unit: '201',
        time: l10n.twoHoursAgo,
        content: l10n.pollQuestion,
        pollOptions: [
          PollOption(label: l10n.pollOption1, percentage: 0.65),
          PollOption(label: l10n.pollOption2, percentage: 0.25),
          PollOption(
              label: l10n.pollOption3, percentage: 0.10, isWarning: true),
        ],
        votesCount: 20,
        pollEndsIn: l10n.pollEndsIn,
      ),
      PostModel(
        type: PostType.image,
        author: l10n.mohamedAli,
        unit: '305',
        time: l10n.fourHoursAgo,
        content: l10n.maintenancePost,
        imagePath: 'assets/images/post_elevator.png',
      ),
      PostModel(
        type: PostType.sale,
        author: l10n.ahmedHassan,
        unit: '501',
        time: l10n.aDayAgo,
        content: l10n.salePost,
        imagePath: 'assets/images/post_dining_table.png',
        price: '3,000',
        isForSale: true,
      ),
    ]);
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
                      hintText: l10n.writeyourposthere,
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
              itemCount: _posts.length + 1,
              itemBuilder: (context, index) {
                if (index == _posts.length) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 8.h),
                    padding: EdgeInsets.all(16.w),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.loadMorePosts,
                            style: TextStyle(
                              color: Palette.green.shade700,
                              fontSize: 14.sp,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.refresh,
                              color: Palette.green.shade700,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
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

class PostModel {
  final String author;
  final String unit;
  final String time;
  final String content;
  final PostType type;
  final List<PollOption>? pollOptions;
  final int? votesCount;
  final String? pollEndsIn;
  final String? imagePath;
  final String? price;
  final bool isForSale;
  final bool isLost;
  bool isLiked;
  int likes;
  int comments;
  int shares;

  PostModel({
    required this.author,
    required this.unit,
    required this.time,
    required this.content,
    this.type = PostType.text,
    this.pollOptions,
    this.votesCount,
    this.pollEndsIn,
    this.imagePath,
    this.price,
    this.isForSale = false,
    this.isLost = false,
    this.isLiked = false,
    this.likes = 24,
    this.comments = 12,
    this.shares = 8,
  });
}

class PollOption {
  final String label;
  final double percentage;
  final bool isWarning;

  PollOption({
    required this.label,
    required this.percentage,
    this.isWarning = false,
  });
}

class PostCard extends StatelessWidget {
  final PostModel post;
  final VoidCallback onLike;

  const PostCard({
    required this.post,
    required this.onLike,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: const NetworkImage(
                    'https://ui-avatars.com/api/?name=User&background=random'),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.s14(post.author, bold: true),
                    CustomText.s12(
                      '${l10n.unitNumber(post.unit)}  •  ${post.time}',
                      color: Palette.neutral.color5,
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert, color: Palette.neutral.color5, size: 20.sp),
            ],
          ),
          SizedBox(height: 12.h),

          // Content
          if (post.isForSale)
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                l10n.forSale,
                style: TextStyle(
                  color: Palette.green.shade700,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          if (post.isLost)
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                l10n.lost,
                style: TextStyle(
                  color: Colors.orange.shade800,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          CustomText.s14(post.content),

          // Poll Section
          if (post.type == PostType.poll && post.pollOptions != null) ...[
            SizedBox(height: 16.h),
            ...post.pollOptions!
                .map((option) => _buildPollOption(context, option)),
            SizedBox(height: 12.h),
            Row(
              children: [
                CustomText.s12(
                  l10n.pollVotes(post.votesCount ?? 0),
                  color: Palette.neutral.color5,
                ),
                const Spacer(),
                CustomText.s12(post.pollEndsIn ?? '',
                    color: Palette.neutral.color5),
              ],
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                l10n.vote,
                style: TextStyle(
                  color: const Color(0xFF4DB6AC),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],

          // Image Section
          if (post.imagePath != null) ...[
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                post.imagePath!,
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),
          ],

          // Sale Footer
          if (post.type == PostType.sale && post.price != null) ...[
            SizedBox(height: 12.h),
            Row(
              children: [
                CustomText.s16(post.price!,
                    bold: true, color: Palette.green.shade700),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009688),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  ),
                  child: Text(l10n.contactSeller,
                      style: TextStyle(fontSize: 12.sp)),
                ),
              ],
            ),
          ],

          SizedBox(height: 16.h),

          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onLike,
                child: Row(
                  children: [
                    Icon(
                      post.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: post.isLiked ? Colors.red : Palette.neutral.color5,
                      size: 18.sp,
                    ),
                    SizedBox(width: 4.w),
                    CustomText.s12(post.likes.toString(),
                        color: Palette.neutral.color5),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline,
                      color: Palette.neutral.color5, size: 18.sp),
                  SizedBox(width: 4.w),
                  CustomText.s12(post.comments.toString(),
                      color: Palette.neutral.color5),
                ],
              ),
              Row(children: [
                Icon(Icons.share, color: Palette.neutral.color5, size: 18.sp),
                SizedBox(width: 4.w),
                CustomText.s12(post.shares.toString(),
                    color: Palette.neutral.color5),
              ])
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPollOption(BuildContext context, PollOption option) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            height: 44.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
          ),
          FractionallySizedBox(
            widthFactor: option.percentage,
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: option.isWarning
                    ? Colors.red.withOpacity(0.1)
                    : const Color(0xFFF1F8F7),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 4.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: option.isWarning
                        ? Colors.red.withOpacity(0.6)
                        : (option.percentage > 0.5
                            ? Palette.green.shade700
                            : Palette.neutral.color4),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 44.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomText.s14(option.label,
                      color: Palette.neutral.color8),
                ),
                CustomText.s12('${(option.percentage * 100).toInt()}%',
                    color: Palette.neutral.color6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
