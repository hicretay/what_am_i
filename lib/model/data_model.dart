import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    String image;
    String name;
    String description;
    List<String> words;

    DataModel({
        required this.image,
        required this.name,
        required this.description,
        required this.words,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        image: json["image"],
        name: json["name"],
        description: json["description"],
        words: List<String>.from(json["words"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "description": description,
        "words": List<dynamic>.from(words.map((x) => x)),
    };
}
