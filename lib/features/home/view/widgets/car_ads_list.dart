import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../model/car_card_model.dart';

class CarAdList extends StatefulWidget {
  final ScrollPhysics? physics;
  final int? listLength;
  final List<CarCardModel> carCardData;
  const CarAdList({super.key, this.physics, required this.carCardData, this.listLength,
  });

  @override
  State<CarAdList> createState() => _CarAdListState();
}

class _CarAdListState extends State<CarAdList> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: widget.physics ?? const NeverScrollableScrollPhysics(),
      itemCount: widget.listLength??  widget.carCardData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.64,
      ),
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
              final selectedCar = widget.carCardData[i];
              AppRouter.goTo(
                screenName: ScreenName.carDetailsForm,
                arguments: selectedCar,
              );
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(widget.carCardData[i].carImage!,),
                context.addVerticalSpace(16),
                Text(
                  widget.carCardData[i].carName!, style: context.inputBold14,),
                context.addVerticalSpace(4),
                Row(
                  children: [
                    Text('${widget.carCardData[i].price} K',
                      style: context.inputBold14,),
                    Text(' AED', style: context.inputRegular14,),
                  ],
                ),
                context.addVerticalSpace(4),
                Row(
                  children: [
                    Image.asset(ImagesManager.showroomIcon),
                    Text(widget.carCardData[i].showroomName!, style: context.bodyRegular,),
                  ],
                ),
                context.addVerticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      color: ColorManager.backgroundColor,
                      child: Text(widget.carCardData[i].gearType!,
                        style: context.inputRegular14.copyWith(
                            fontSize: 12,
                            color: ColorManager.gearTypeColor),
                      ).padVerticalSymmetric(4).padSymmetric(11),

                    ),
                    Image.asset(widget.carCardData[i].carLogo!)
                  ],
                )
              ],
            ).padSymmetric(8).padVerticalSymmetric(16),
          ),
        );
      },
    );
  }
}
