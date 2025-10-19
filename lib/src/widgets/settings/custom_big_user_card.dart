import 'package:flutter/material.dart';

class CustomBigUserCard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? settingColor;
  final double? cardRadius;
  final Color? backgroundMotifColor;
  final Widget? cardActionWidget;
  final String? userName;
  final Widget? userMoreInfo;
  final ImageProvider userProfilePic;
  final BoxFit imageFit;
  final double avatarBorderRadius;
  final double avatarSize;

  const CustomBigUserCard({
    Key? key,
    this.backgroundColor,
    this.settingColor,
    this.cardRadius = 30,
    required this.userName,
    this.backgroundMotifColor = Colors.white,
    this.cardActionWidget,
    this.userMoreInfo,
    required this.userProfilePic,
    this.imageFit = BoxFit.cover,
    this.avatarBorderRadius = 16.0,
    this.avatarSize = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;

    var containerHeight = 210.0;

    // if (mediaQueryHeight < 800) {
    //   containerHeight = 800 / 4;
    // } else if (mediaQueryHeight < 900) {
    //   containerHeight = mediaQueryHeight / 3;
    // } else {
    //   containerHeight = mediaQueryHeight / 3;
    // }

    return Container(
      height: containerHeight,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(cardRadius!),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: backgroundMotifColor!.withOpacity(.1),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 400,
              backgroundColor: backgroundMotifColor!.withOpacity(.05),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: (cardActionWidget != null)
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // User profile with custom fit - 圆角矩形头像
                    Expanded(
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(avatarBorderRadius),
                          child: Container(
                            width: avatarSize,
                            height: avatarSize,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(avatarBorderRadius),
                            ),
                            child: Image(
                              image: userProfilePic,
                              fit: imageFit,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.person,
                                  size: avatarSize * 0.6,
                                  color: Colors.grey[600],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              userName!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: mediaQueryHeight / 30,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          if (userMoreInfo != null) ...[
                            userMoreInfo!,
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: settingColor ?? Theme.of(context).cardColor,
                  ),
                  child: (cardActionWidget != null)
                      ? cardActionWidget
                      : Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
