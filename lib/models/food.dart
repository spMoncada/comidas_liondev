enum TypeFood { breakfast, lunch }

class Food {
  Food({
    required this.typeFood,
    required this.price,
  });

  TypeFood typeFood;
  double price;
}
