import '../../../core/constant/images_manager.dart';

class OnbordingModel {
  OnbordingModel({this.image , this.body , this.title});
  final String? image;
  final String? title;
  final String? body;

}

List<OnbordingModel>onbordingList = [
  OnbordingModel(
      image: ImagesManager.onbording_1,
      title: "Welcome to CarAds App",
      body:  " CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you're a car showroom owner or looking to rent a vehicle, our platform has got you covered!",

  ),
  OnbordingModel(
      image: ImagesManager.onbording_2,
      title: "Effortless Ads Management",
      body:"Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds",

  ),
  OnbordingModel(
      image: ImagesManager.onbording_3,
      title: "Explore Your Options",
      body: "Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds",

  ),
];