

class ProjectFields {
  static final List<String> values = [
    projectId, projectTitle
  ];
  static final String projectId = '_id';
  static final String projectTitle = 'projectTitle';

// static final String id = '_id';

}
class Project  {
  final int? projectId;
  final String projectTitle;


  Project(
      {
        this.projectId,
        required this.projectTitle,

        });

}

List<Project> projects = [
  Project(projectTitle: 'Project'),
  Project(projectTitle: 'Teamworks'),
  Project(projectTitle: 'Home'),
  Project(projectTitle: 'Meet'),
];
