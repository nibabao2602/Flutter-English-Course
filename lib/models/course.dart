class Course {
  String author;
  String authorImg;
  String title;
  String imageUrl;

  Course(this.author, this.authorImg, this.title, this.imageUrl);

  static List<Course> generateCourses() {
    return [
      Course('Luma lanari', 'assets/images/course01.jpg', 'Plant',
          'assets/images/course01.jpg'),
      Course('Luma lanari2', 'assets/images/course01.jpg', 'Plant',
          'assets/images/course01.jpg'),
      Course('Luma lanari3', 'assets/images/course01.jpg', 'Plant',
          'assets/images/course01.jpg'),
    ];
  }
}
