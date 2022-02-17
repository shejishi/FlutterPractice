class HomeList {
  HomeList({
    this.imagePath = '',
  });

  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
    ),
    HomeList(
      imagePath: 'assets/design_course/design_course.png',
    ),
  ];
}
