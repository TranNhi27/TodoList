

class User {
  final String name;
  final String email;
  final String avatar;
  User({required this.name, required this.email, this.avatar = 'assets/images/user.png'});

  static List<Map<String, String>> getSuggestions(String query) {
    return List.generate(users.length, (index) {
      return {
        'name': users[index].name,
        'email': users[index].email,
        'avatar': users[index].avatar
      };
    });
  }
  }

List<User> users = [
  User(name: 'Hayden', email: 'hayden@gm.com', avatar: 'assets/images/profile.jpg'),
  User(name: 'Irene', email: 'yeri@gm.com', avatar: 'assets/images/profile2.jpg'),
  User(name: 'Wendy', email: 'wendy@gm.com', avatar: 'assets/images/profile3.jpg')
];

List<User> users2 = [
  User(name: 'Hayden', email: 'hayden@gm.com', avatar: 'assets/images/profile.jpg'),
  User(name: 'Irene', email: 'yeri@gm.com', avatar: 'assets/images/profile2.jpg'),
];

List<String> members = [];

