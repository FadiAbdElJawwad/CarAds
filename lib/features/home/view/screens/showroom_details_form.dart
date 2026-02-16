import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/car_image_extractor.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../common/primary_app_bar.dart';
import '../../model/showroom_model.dart';
import '../widgets/car_ads_list.dart';

class ShowroomDetailsForm extends StatefulWidget {
  final ShowroomModel showroom;
  const ShowroomDetailsForm({super.key, required this.showroom});

  @override
  State<ShowroomDetailsForm> createState() => _ShowroomDetailsFormState();
}

class _ShowroomDetailsFormState extends State<ShowroomDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).padding.top),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: widget.showroom.showroomName ?? 'Showroom Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarImageExtractor.buildImage(widget.showroom.showroomImage,height: context.height(200)),

            context.addVerticalSpace(10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.showroom.showroomName ?? '',
                      style: context.bodyBold),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagesManager.share)),
                ]),
            context.addVerticalSpace(8),
            Row(
              children: [
                Image.asset(ImagesManager.locationIcon),
                context.addHorizontalSpace(4),
                Text(widget.showroom.showroomLocation ?? '',
                    style: context.bodyRegular)
              ],
            ),
            context.addVerticalSpace(8),
            Row(
              children: [
                Image.asset(ImagesManager.contactIcon),
                context.addHorizontalSpace(4),
                Text(widget.showroom.showroomPhone ?? '',
                    style: context.bodyRegular)
              ],
            ),
            context.addVerticalSpace(24),
            Text('About showroom', style: context.bodyBold),
            context.addVerticalSpace(4),
            Text(
              widget.showroom.showroomDescription ?? '',
              style: context.bodyRegular,
            ),
            context.addVerticalSpace(24),
            Text('${widget.showroom.showroomName ?? ''} Ads',
                style: context.bodyBold),
            context.addVerticalSpace(8),
            CarAdList(
              showroomID: widget.showroom.showroomID,
              carIDs: widget.showroom.carID,
              physics: const NeverScrollableScrollPhysics(),
            )
          ],
        ).padSymmetric(20),
      ),
    );
  }
}

