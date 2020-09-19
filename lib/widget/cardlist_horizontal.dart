import 'package:flutter/material.dart';

class CardListHorizontal extends StatelessWidget {
  final String title, imgAuthor, author, img;

  CardListHorizontal({this.title, this.img, this.imgAuthor, this.author});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        width: width / 1.3,
        height: height / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                image: NetworkImage(title == ""
                    ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png"
                    : img),
                fit: BoxFit.cover)),
      ),
      Positioned(
        top: 24,
        right: 24,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      Positioned.fill(
        top: height / 8,
        left: 24,
        right: 24,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title == null ? "" : title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    author == null ? "" : author,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
