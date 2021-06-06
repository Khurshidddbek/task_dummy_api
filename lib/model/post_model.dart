class Post {
  int id;
  String name;
  String salary;
  String age;

  Post({this.id, this.name, this.salary, this.age});

  Map<String, dynamic> toJson() => {
    'id' : id.toString(),
    'name' : name,
    'salary' : salary,
    'age' : age,
  };

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        salary = json['salary'],
        age = json['age'];
}