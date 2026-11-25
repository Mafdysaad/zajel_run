import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';

class CustomNewsCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String author;
  final String date;

  const CustomNewsCard({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: image,
              width: 140,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Fontstyle.openSansBold18(context).copyWith(
                    fontSize: responsivesize(context, fontsize: 17),
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 40),

                // Author and Date
                Row(
                  children: [
                    Text(
                      'By $author',
                      style: Fontstyle.openSansRegular14(context)
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    Spacer(),
                    Text(
                      date,
                      style: Fontstyle.openSansSemiBold14(context)
                          .copyWith(color: Color(0xFF17616B)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
