import 'package:flutter/material.dart';
import 'package:live_streaming_app/core/style/global_text_style.dart';
import 'package:live_streaming_app/features/home/model/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserCard({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// IMAGE / FIRST LETTER
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      color: Colors.grey.shade300,
                      image: user.profileImage.isNotEmpty
                          ? DecorationImage(
                        image: NetworkImage(user.profileImage),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: user.profileImage.isEmpty
                        ? Center(
                      child: Text(
                        user.userName.isNotEmpty
                            ? user.userName[0].toUpperCase()
                            : "?",
                        style: globalTextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                        : null,
                  ),
                  // live badge....
                  if(user.isLive)
                  Positioned(
                      top: 5,
                      left: 4,
                      child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                         decoration: BoxDecoration(
                           color: Colors.red,
                           borderRadius: BorderRadius.circular(20),
                         ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.circle,color: Colors.white,size: 8),
                            SizedBox(width: 6),
                            Text(
                              "Live",
                              style: globalTextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                  )
                ],
              ),
            ),

            /// NAME (BOTTOM)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                user.userName,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: globalTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}