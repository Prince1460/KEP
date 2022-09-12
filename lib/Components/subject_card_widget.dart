import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/constants.dart';
import 'progress_indicator.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String image;
  final double progress;
  SubjectCard(
      {required this.title,
      required this.onTap,
      required this.image,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: primaryColor,
            ),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(
                image,
              ),
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              title,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(
                    value: progress,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
