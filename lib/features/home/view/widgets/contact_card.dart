import 'package:flutter/material.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/text_style_extension.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              ImagesManager.showroom, fit: BoxFit.cover,)),
        title: Text('Showroom Name', style: context.bodyBold,),
        subtitle: Text('****', style: context.bodyRegular,),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {},
                icon: Image.asset(ImagesManager.whatsappIcon)),
            IconButton(onPressed: () {},
                icon: Image.asset(ImagesManager.callIcon))
          ],
        ),
      ),
    );
  }
}
