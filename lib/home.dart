import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:latihan_simplean/bloc/kecamatan_bloc/bloc.dart';
import 'package:latihan_simplean/detail.dart';
import 'package:latihan_simplean/models/kecamatan_model.dart';
import 'package:latihan_simplean/repository/kecamatan_repo.dart';
import 'package:latihan_simplean/widget/cardlist_horizontal.dart';

class Home extends StatelessWidget {
  final String nama = "Kukuh Indra krisdiantoro";
  final String alamat = "Majenang";
  KecamatanRepo kecamatanRepo = KecamatanRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 40,
            height: 10,
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 18,
            ),
          )
        ],
        title: Text(
          'Ngapak News Time',
          style: TextStyle(
              color: Colors.black, fontFamily: "Chomsky", fontSize: 24),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          top: false,
          child: BlocProvider<KecamatanBloc>(
            create: (context) => KecamatanBloc(kecamatanRepo: kecamatanRepo)
              ..add(FetchKecamatan()),
            child: BlocBuilder<KecamatanBloc, KecamatanState>(
              builder: (context, state) {
                if (state is UnintializedState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FetchingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ErrorState) {
                  return Center(
                    child: Text('Error njing'),
                  );
                } else {
                  final currentState = state as FetchedState;
                  final kecamatanModel = currentState.kecamatanModel;
                  return _buildListView(context, kecamatanModel);
                }
              },
            ),
          )),
    );
  }

  Widget _buildListView(BuildContext context, KecamatanModel kecamatanModel) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 4;
    var kec = kecamatanModel;
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ngapak Terbaru',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Lihat Semua',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            )
          ],
        ),
      ),
      Container(
        height: height / 0.7,
        width: width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, i) {
              return Padding(
                padding: (i == 0)
                    ? const EdgeInsets.only(left: 24.0, top: 24.0, right: 16)
                    : (i == 4)
                        ? const EdgeInsets.only(
                            left: 16.0, top: 24.0, right: 24)
                        : const EdgeInsets.only(
                            left: 16.0, top: 24.0, right: 16),
                child: CardListHorizontal(
                  title: kec.articles[i].title,
                  author: kec.articles[i].author,
                  img: kec.articles[i].urlToImage,
                ),
              );
            }),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Berita Tergokil',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Lihat Semua',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            )
          ],
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: kec.articles.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: kec.articles[i].title,
                    content: kec.articles[i].content,
                    author: kec.articles[i].author,
                    imgUrl: kec.articles[i].urlToImage,
                    date: kec.articles[i].publishedAt,
                  ),
                )),
            child: Container(
              margin: (i == 0)
                  ? const EdgeInsets.only(
                      top: 24, right: 24, left: 24, bottom: 12)
                  : const EdgeInsets.only(
                      top: 12, right: 24, left: 24, bottom: 12),
              width: width,
              // height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(kec.articles[i].urlToImage ==
                                      null
                                  ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1200px-No_image_available.svg.png"
                                  : kec.articles[i].urlToImage),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kec.articles[i].title == null
                                ? "No title"
                                : kec.articles[i].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              kec.articles[i].description == null
                                  ? "No Description"
                                  : kec.articles[i].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    size: 12,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      kec.articles[i].publishedAt == null
                                          ? '0-0-0000'
                                          : kec.articles[i].publishedAt,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12)),
                                ],
                              ),
                              Text('12:00',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12))
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    ]);
  }
}
