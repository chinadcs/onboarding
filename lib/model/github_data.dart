class User {
  User({
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.login,
    required this.bio,
    required this.repositories,
  });

  String avatarUrl;
  String name;
  String email;
  String login;
  String bio;
  List repositories;

  // factory User.fromJson(Map<String, dynamic> json) => User(
  //       avatarUrl: json["avatarUrl"],
  //       name: json["name"],
  //       email: json["email"],
  //       login: json["login"],
  //       bio: json["bio"],
  //       repositories: Repositories.fromJson(json["repositories"]),
  //     );

  Map<String, dynamic> toJson() => {
        "avatarUrl": avatarUrl,
        "name": name,
        "email": email,
        "login": login,
        "bio": bio,
        // "repositories": repositories.toJson(),
      };
}

class Repositories {
  Repositories({
    required this.edges,
  });

  List<Edge> edges;

  factory Repositories.fromJson(Map<String, dynamic> json) => Repositories(
        edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class Edge {
  Edge({
    required this.node,
  });

  Node node;

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class Node {
  Node({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
