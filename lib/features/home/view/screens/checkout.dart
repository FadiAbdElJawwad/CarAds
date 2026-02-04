import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../../common/primary_button.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
          text: 'Checkout',
        ),
      ),
      body: ListView(
        children: [
          Text('Shipping Address', style: context.bodyBold,),
          context.addVerticalSpace(8),
          Image.asset(ImagesManager.map, height: 150, fit: BoxFit.cover,),
          context.addVerticalSpace(24),
          PrimaryTextField(
            hint: 'Driving License No',
            keyboardType: TextInputType.number,
          ),
          context.addVerticalSpace(24),
          PrimaryTextField(
            hint: 'ID Number',
            keyboardType: TextInputType.number,
          ),
          context.addVerticalSpace(24),
          PrimaryTextField(
            hint: 'Phone Number',
            keyboardType: TextInputType.phone,
          ),
          context.addVerticalSpace(24),
          Text('Rental From', style: context.bodyRegular,),
          context.addVerticalSpace(8),
          Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    hint: 'Date',
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                context.addHorizontalSpace(16),
                Expanded(
                  child: PrimaryTextField(
                    hint: 'The hour',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ]
          ),
          context.addVerticalSpace(16),
          Text('Rental Until', style: context.bodyRegular,),
          context.addVerticalSpace(8),
          Row(
              children: [
                Expanded(
                  child: PrimaryTextField(
                    hint: 'Date',
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                context.addHorizontalSpace(16),
                Expanded(
                  child: PrimaryTextField(
                    hint: 'The hour',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ]
          ),
          context.addVerticalSpace(24),
          Text('Order', style: context.bodyBold,),
          context.addVerticalSpace(8),
          Card(
            child: ListTile(
              leading: Image.asset(ImagesManager.toyota),
              title: Text('Toyota', style: context.bodyBold,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('1600/', style: context.bodyBold,),
                  Text('AED', style: context.bodyRegular,)
                ],
              ),
            ).padVerticalSymmetric(16),
          ),
          context.addVerticalSpace(24),
          Text('Price Details', style: context.bodyBold,),
          context.addVerticalSpace(8),
          Card(
            child: Column(
                children: [
                  ListTile(
                    title: Text('Amount', style: context.bodyRegular,),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('1600/', style: context.bodyBold.copyWith(
                            color: Colors.grey),),
                        Text('AED', style: context.bodyRegular.copyWith(
                            color: Colors.grey),)
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Shipping', style: context.bodyRegular,),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('1000/', style: context.bodyBold.copyWith(
                            color: Colors.grey),),
                        Text('AED', style: context.bodyRegular.copyWith(
                            color: Colors.grey),)
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Tax', style: context.bodyRegular,),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('1000/', style: context.bodyBold.copyWith(
                            color: Colors.grey),),
                        Text('AED', style: context.bodyRegular.copyWith(
                            color: Colors.grey),)
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey,).padSymmetric(20),
                  ListTile(
                    title: Text('Total payment', style: context.bodyRegular,),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('1800/', style: context.bodyBold,),
                        Text('AED', style: context.bodyRegular,)
                      ],
                    ),
                  ),
                ]
            ),
          ),
          context.addVerticalSpace(40),
          PrimaryButton(
              text: 'Continue to payment ',
              onPressed: () {}
          )
        ],
      ).padSymmetric(20),
    );
  }
}
