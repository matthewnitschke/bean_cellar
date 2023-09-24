import 'package:bean_cellar/components/take_avatar_photo.dart';
import 'package:bean_cellar/models/bean.sg.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class BeanAvatar extends StatefulWidget {
  final String beanId;
  const BeanAvatar(this.beanId, {super.key});

  @override
  State<BeanAvatar> createState() => _BeanAvatarState();
}

class _BeanAvatarState extends State<BeanAvatar> {
  var _isTakingPhoto = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isTakingPhoto = !_isTakingPhoto),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: _isTakingPhoto
            ? TakeAvatarPhoto()
            : CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
              ),
        // child: TakeAvatarPhoto(),
      ),
    );
  }
}
