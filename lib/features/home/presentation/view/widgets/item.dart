// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:firebase/core/consts/style.dart';
import 'package:firebase/core/models/item_model.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.car,
  }) : super(key: key);
  final ItemModel car;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppConsts.mainColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: size.height * .15,
                width: size.width * .45,
                child: Image.network(
                  car.imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: size.width * .1),
            Column(
              children: [
                Text(car.name!),
                SizedBox(height: size.height * .01),
                Text(car.model!),
                SizedBox(height: size.height * .01),
                Text(car.color!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
