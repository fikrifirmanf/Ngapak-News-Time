import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title, author, content, date, imgUrl;

  const DetailPage(
      {Key key, this.title, this.author, this.content, this.date, this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      top: false,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            right: 24,
            left: 10,
            top: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                Icon(
                  Icons.save,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Positioned.fill(
              right: 24,
              left: 24,
              bottom: 24,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        title == null ? "No title" : title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- " + author,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
        ],
      ),
    ));
  }
}
