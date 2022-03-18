import 'package:csi5112/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductModels_Mock with ChangeNotifier {
  static List<ProductModel> products = [
    ProductModel(
        id: 0,
        name: "Orange",
        categoryName: "Fruit",
        imgUrl:
            "https://cdn.pixabay.com/photo/2017/01/20/15/06/oranges-1995056__340.jpg",
        price: 0.99,
        quantity: 1,
        description: 'This is an orange.'),
    ProductModel(
        id: 1,
        name: "Coca Cola",
        categoryName: "Beverage",
        imgUrl:
            "https://cdn.pixabay.com/photo/2015/01/08/04/18/box-592367__480.jpg",
        price: 1.99,
        quantity: 1,
        description: 'This is a Coke.'),
    ProductModel(
        id: 2,
        name: "Ginger",
        categoryName: "Vegetable",
        imgUrl:
            "https://cdn.pixabay.com/photo/2016/10/13/15/50/ginger-1738098__340.jpg",
        price: 2.49,
        quantity: 1,
        description: 'This is a ginger.'),
    ProductModel(
        id: 3,
        name: "Strawberry",
        categoryName: "Fruit",
        imgUrl:
            "https://cdn.pixabay.com/photo/2018/04/29/11/54/strawberries-3359755_1280.jpg",
        price: 0.79,
        quantity: 1,
        description: 'This is a strawberry.'),
    ProductModel(
        id: 4,
        name: "Broccoli",
        categoryName: "Vegetable",
        imgUrl:
            "https://cdn.pixabay.com/photo/2016/03/05/22/00/broccoli-1239149_1280.jpg",
        price: 3.29,
        quantity: 1,
        description: 'This is a broccoli.'),
    ProductModel(
        id: 5,
        name: "Potato",
        categoryName: "Vegetable",
        imgUrl:
            "https://cdn.pixabay.com/photo/2016/08/11/08/43/potatoes-1585060_1280.jpg",
        price: 3.29,
        quantity: 1,
        description: 'This is a potato.'),
    ProductModel(
        id: 6,
        name: "Pepper",
        categoryName: "Vegetable",
        imgUrl:
            "https://cdn.pixabay.com/photo/2014/08/18/23/11/bell-peppers-421087_1280.jpg",
        price: 2.19,
        quantity: 1,
        description: 'This is a pepper.'),
    ProductModel(
        id: 7,
        name: "Carrot",
        categoryName: "Vegetable",
        imgUrl:
            "https://cdn.pixabay.com/photo/2017/06/09/16/39/carrots-2387394_1280.jpg",
        price: 3.29,
        quantity: 1,
        description: 'This is a carrot.'),
    ProductModel(
        id: 8,
        name: "Pear",
        categoryName: "Fruit",
        imgUrl:
            "https://cdn.pixabay.com/photo/2016/07/22/09/59/fruits-1534494_1280.jpg",
        price: 0.59,
        quantity: 1,
        description: 'This is a pear.'),
    ProductModel(
        id: 9,
        name: "Apple",
        categoryName: "Fruit",
        imgUrl:
            "https://cdn.pixabay.com/photo/2017/09/26/13/42/apple-2788662_1280.jpg",
        price: 3.29,
        quantity: 1,
        description: 'This is an apple .'),
    ProductModel(
        id: 10,
        name: "Blueberry",
        categoryName: "Fruit",
        imgUrl:
            "https://cdn.pixabay.com/photo/2018/06/07/16/38/blueberries-3460423_1280.jpg",
        price: 3.29,
        quantity: 1,
        description: 'This is a blueberry.'),
    ProductModel(
        id: 11,
        name: "Starbucks Coffee",
        categoryName: "Beverage",
        imgUrl:
            "https://cdn.pixabay.com/photo/2017/05/26/15/02/starbucks-2346226_1280.jpg",
        price: 6.49,
        quantity: 1,
        description: 'This is a cup of coffee.'),
    ProductModel(
        id: 12,
        name: "Pepsi Coke",
        categoryName: "Beverage",
        imgUrl:
            "https://cdn.pixabay.com/photo/2020/09/18/23/17/pepsi-5583105_1280.jpg",
        price: 1.49,
        quantity: 1,
        description: 'This is a pepsi coke.'),
    ProductModel(
        id: 13,
        name: "Lemonade",
        categoryName: "Beverage",
        imgUrl:
            "https://cdn.pixabay.com/photo/2018/02/23/09/43/juice-3175117_1280.jpg",
        price: 4.99,
        quantity: 1,
        description: 'This is a alcohol.'),
    ProductModel(
        id: 14,
        name: "Beer",
        categoryName: "Beverage",
        imgUrl:
            "https://cdn.pixabay.com/photo/2014/08/10/18/06/beers-414914_1280.jpg",
        price: 7.29,
        quantity: 1,
        description: 'This is a beer.'),
  ];
}
