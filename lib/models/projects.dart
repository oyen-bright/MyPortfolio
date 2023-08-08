class Projects {
  String imageString;
  String projectName;
  String gitLink;
  String playStoreLink;
  String appStoreLink;
  String typeOfProject;
  String projectDescription;

  Projects(
      {required this.imageString,
      required this.projectName,
      this.gitLink = "",
      this.appStoreLink = "",
      this.playStoreLink = "",
      required this.typeOfProject,
      required this.projectDescription});
}
