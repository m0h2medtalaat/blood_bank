class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
    'BloodBank is a Blood Donor App ( BloodBank ) which puts the power to save a lives in the palm of your hand.',
  );
  sliderModel.setImageAssetPath("resources/slide1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
    'BloodBank is a Blood Donor App ( BloodBank ) which puts the power to save a lives in the palm of your hand.',
  );
  sliderModel.setImageAssetPath("resources/slide2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
    'The main purpose of BloodLine App is to create & manage a platform for all blood donors of Bangladesh & remove the blood crisis.',
  );
  sliderModel.setImageAssetPath("resources/slide3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
