class RecipeModel {
  String? title;
  String? image;
  String? description;
  List<String>? steps;

  RecipeModel({
    required this.title,
    required this.image,
    required this.description,
    required this.steps,
  });

  RecipeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];

    steps = List<String>.from(json['steps']);
  }
}

//! for sweets screen
class SrecipeModel {
  String? stitle;
  String? simage;
  String? sdescription;
  List<String>? ssteps;

  SrecipeModel({
    required this.stitle,
    required this.simage,
    required this.sdescription,
    required this.ssteps,
  });

  SrecipeModel.fromJson(Map<String, dynamic> json) {
    stitle = json['stitle'];
    simage = json['simage'];
    sdescription = json['sdescription'];

    ssteps = List<String>.from(json['ssteps']);
  }
}

//! for festival special
class FrecipeModel {
  String? ftitle;
  String? fimage;
  String? fdescription;
  List<String>? fsteps;

  FrecipeModel({
    required this.ftitle,
    required this.fimage,
    required this.fdescription,
    required this.fsteps,
  });

  FrecipeModel.fromJson(Map<String, dynamic> json) {
    ftitle = json['ftitle'];
    fimage = json['fimage'];
    fdescription = json['fdescription'];

    fsteps = List<String>.from(json['fsteps']);
  }
}
