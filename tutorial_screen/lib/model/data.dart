class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImagePath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImagePath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlider() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  sliderModel.setImagePath("assets/illustration.png");
  sliderModel.setTitle("title 1");
  sliderModel.setDesc("desc 1");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImagePath("assets/illustration.png");
  sliderModel.setTitle("title 2");
  sliderModel.setDesc("desc 2");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImagePath("assets/illustration.png");
  sliderModel.setTitle("title 3");
  sliderModel.setDesc("desc 3");
  slides.add(sliderModel);

  return slides;
}
