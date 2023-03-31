import 'package:flutter/material.dart';

import 'ad.dart';
import 'diary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // 슬리버를 사용하려면 내부에도 전부 슬리버를 넣어서 계산값을 공유해야함
        slivers: [
          SliverAppBar(
            snap: true, // floating과 함께 사용 조금만 아래로 터치하면 앱바가 전부 내려온다.
            floating: true,
            title: Text("상단 메뉴는 어때 ?"),
            pinned: false, // 상단 앱바를 스크롤 내릴때만 나타나게
            expandedHeight: 250, // 내리면 어디까지 정보를 나타낼지 적용 ->flexible space
            flexibleSpace: Container(
              child: Center(
                child: Text("FlexibleSpace", style: TextStyle(fontSize: 50),),
              ),
            ), // 디폴트 60
            centerTitle: true,
          ),
          SliverAppBar(
            title: Text("얘는 항상 보이니까 뭔가 누르는 ?"),
            pinned: true, // 상단 앱바를 스크롤 내릴때만 나타나게
            centerTitle: true,
          ),
          SliverFixedExtentList(
            itemExtent: 100, // 내부 요소의 크기지정을 무시한다.
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              if ( index % 4 == 0 && index != 0) return AD(((index/4)-1).toInt());
              return Diary(index);
            },
          )),
        ],
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: 30,
      (context, index) {
        return Container(
          alignment: Alignment.center,
          height: 50,
          color: Colors.lightBlue[100 * (index % 9)],
          child: Text("List Item $index"),
        );
      },
    ));
  }
}
