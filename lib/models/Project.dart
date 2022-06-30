

class ProjectFields {
  static final List<String> values = [
    projectId, projectTitle
  ];
  static final String projectId = '_id';
  static final String projectTitle = 'projectTitle';
  static final String hour = 'totalTask';
// static final String id = '_id';

}
class Project  {
  final int? projectId;
  final String projectTitle;
  final int totalTask;

  Project(
      {
        this.projectId,
        required this.projectTitle,
        required this.totalTask,
        });

}

List<Project> projects = [
  Project(projectTitle: 'Project', totalTask: 10),
  Project(projectTitle: 'Teamworks', totalTask: 5),
  Project(projectTitle: 'Home', totalTask: 10),
  Project(projectTitle: 'Meet', totalTask: 10),
];
