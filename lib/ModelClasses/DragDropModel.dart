class DragDropModel {
  late int index;
  late int where;
  late String image;
  late String first_text;
  late String second_text;
  DragDropModel({required this.index, required this.image, required this.first_text,required this.second_text,required this.where});

  @override
  String toString() {
    return '$index : $first_text';
  }
}