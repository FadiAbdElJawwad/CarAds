import '../../../core/constant/images_manager.dart';

class CarTypeModel {

  CarTypeModel({this.carLogo ,required this.carType});
  final String? carLogo;
  final String carType;
}
List<CarTypeModel> carTypeList = [
  CarTypeModel(
      carType: 'All Cars'
  ),
  CarTypeModel(
    carLogo: ImagesManager.bmwLogo,
      carType: 'BMW'
  ),
  CarTypeModel(
    carLogo: ImagesManager.toyotaLogo,
      carType: 'Toyota'
  ),
  CarTypeModel(
    carLogo: ImagesManager.audiLogo,
      carType: 'Audi'
  ),
  CarTypeModel(
    carLogo: ImagesManager.kiaLogo,
      carType: 'Kia'
  ),
  CarTypeModel(
    carLogo: ImagesManager.mazdaLogo,
      carType: 'Mazda'
  ),


];
