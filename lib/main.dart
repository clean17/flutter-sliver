import 'package:flutter/material.dart';
import 'package:flutter_sliver/ad.dart';

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
        slivers: [
          // SliverAppBar(
          //   snap: true,
          //   // floating과 함께 사용 조금만 아래로 터치하면 앱바가 전부 내려온다.
          //   floating: true,
          //   title: Text("SliverAppBar"),
          //   pinned: false,
          //   // 상단 앱바를 스크롤 내릴때만 나타나게
          //   expandedHeight: 250,
          //   // 내리면 어디까지 정보를 나타낼지 적용 ->flexible space
          //   flexibleSpace: Container(
          //     child: Center(
          //         child:
          //         // Image(image: AssetImage("assets/다운로드 (1).jpg"))
          //       Image.network("https://picsum.photos/200/300", fit: BoxFit.cover)
          //     ),
          //   ),
          //   // 디폴트 60
          //   centerTitle: true,
          // ),
          // const SliverAppBar(
          //   title: Text("pinned"),
          //   pinned: true, // 상단 앱바를 스크롤 내릴때만 나타나게
          //   centerTitle: true,
          // ),
          SliverList(
              // delegate: SliverChildListDelegate(
              //   [
              //     Container(
              //       child: Image(image: NetworkImage('https://picsum.photos/id/1/200/300'),fit: BoxFit.cover),
              //     ),
              //     SizedBox(height: 10,),
              //     Container(
              //       child: Image(image: NetworkImage('https://picsum.photos/id/2/200/300'),fit: BoxFit.cover),
              //     ),
              //     SizedBox(height: 10,),
              //     Container(
              //       child: Image(image: NetworkImage('https://picsum.photos/id/3/200/300'),fit: BoxFit.cover),
              //     ),
              //   ]
              // ),
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Image.network("https://picsum.photos/id/${index}/200/300",fit: BoxFit.contain,),
                ),
            )
          ),


          SliverToBoxAdapter(
              // 스크롤 마지막에만 보이게 된다. 일반적인 위젯을 슬리버 안에 사용할수 있게 해준다.
              // 예를 들어 컨테이너는 이러한 슬리버 안에 사용불가지만 어뎁터가 연결시켜줌
              child: Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Image(
                    image: AssetImage("assets/다운로드 (${index + 1}).jpg"));
              },
            ),
          )),


          SliverFixedExtentList(
              itemExtent: 100, // 내부 요소의 크기지정을 무시한다.
              delegate: SliverChildBuilderDelegate(
                // 계산기 필요하면 빌더를 사용해야함
                (context, index) {
                  if (index % 4 == 0 && index != 0)
                    return Ad(((index / 4) - 1).toInt());
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
