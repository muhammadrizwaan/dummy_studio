import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';

class ImagesModal {
  final String imagePath;

  ImagesModal({@required this.imagePath});
}

List<ImagesModal> getAllImages = [ImagesModal(imagePath: Assets.vehicle_img)];
