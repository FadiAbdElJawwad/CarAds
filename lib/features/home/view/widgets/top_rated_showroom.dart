import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../model/top_rated_showroom_model.dart';

class TopRatedShowroom extends StatefulWidget {
  const TopRatedShowroom({super.key});

  @override
  State<TopRatedShowroom> createState() => _TopRatedShowroomState();
}

class _TopRatedShowroomState extends State<TopRatedShowroom> {

  late List<TopRatedShowroomModel> topRatedShowroomData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    topRatedShowroomData = topRatedShowroomList(context);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: topRatedShowroomData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            AppRouter.goTo(screenName: ScreenName.showroomDetailsForm);
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      topRatedShowroomData[i].image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                context.addVerticalSpace(4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        topRatedShowroomData[i].showroomName!,
                        style: context.bodyRegular,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagesManager.share, width: 8),
                    )
                  ],
                ),
                context.addVerticalSpace(4),
                Card(
                  elevation: 0,
                  color: ColorManager.ratingColor,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(topRatedShowroomData[i].rating!
                          .toString()),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      )
                    ],
                  ).padSymmetric(8),
                )
              ],
            ).pad(8),
          ),
        );
      },
    );
  }
}
