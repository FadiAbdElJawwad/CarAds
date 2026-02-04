import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../common/primary_app_bar.dart';
import '../widgets/car_ads_list.dart';

class ShowroomDetailsForm extends StatefulWidget {
  const ShowroomDetailsForm({super.key});

  @override
  State<ShowroomDetailsForm> createState() => _ShowroomDetailsFormState();
}

class _ShowroomDetailsFormState extends State<ShowroomDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + MediaQuery
            .of(context)
            .padding
            .top),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: 'Showroom Name',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImagesManager.showroom,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.cover,
            ),
            context.addVerticalSpace(10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Showroom Name', style: context.bodyBold,),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagesManager.share)
                  ),
                ]
            ),
            context.addVerticalSpace(8),
            Row(
              children: [
                Image.asset(ImagesManager.locationIcon),
                context.addHorizontalSpace(4),
                Text('Street name, city name, district',
                  style: context.bodyRegular,)
              ],
            ),
            context.addVerticalSpace(8),
            Row(
              children: [
                Image.asset(ImagesManager.contactIcon,),
                context.addHorizontalSpace(4),
                Text('+971 55 253 0438', style: context.bodyRegular,)
              ],
            ),
            context.addVerticalSpace(24),
            Text('About showroom', style: context.bodyBold,),
            context.addVerticalSpace(4),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.',
              style: context.bodyRegular,
            ),
            context.addVerticalSpace(24),
            Text('Showroom Name Ads', style: context.bodyBold,),
            context.addVerticalSpace(8),
            CarAdList(
              listLength: 4,
            )
          ],
        ).padSymmetric(20),
      ),
    );
  }
}