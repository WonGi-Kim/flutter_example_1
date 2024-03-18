import 'package:flutter/material.dart';

//앱의 시작 부분 main이다.
void main() { 
  runApp(const MyApp());
}
/** 시작 클래스. 머티리얼 디자인 앱 생성, 머티리얼 디자인 앱이란?
 * 
 * 머티리얼 디자인: 플랫 디자인의 장점을 살리면서도 빛에 따른 종이의 그림자 효과를 이용하여 입체감을 살리는 디자인을 말한다.
 * 플랫 디자인은 또 뭘까? : 사용자 인터페이스 디자인 중 하나로 단순하고 깔끔한 요소를 강조하며, 그림자와 입체 효과를 최소화 하는 디자인
 * 머티리얼 디자인과 iOS Human Interface Guidelines에서 사용하는 요소들!
 */

//  StatelessWidget? : 정적 위젯, 화면이 로드될 때 한번만 그려지며, 변경이 필요한 데이터가 없음
//  사용자 상호 작용이 필요하지 않은 구성 요소를 구성할 때 사용.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 부모 클래스의 생성자를 속성을 참조하는 부분 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { // 화면을 구성하는 역할을 함
    return MaterialApp( //  Widget을 반환하며 기본 테마와 라우팅을 설정하는 데 사용
      title: 'Flutter Demo',
      theme: ThemeData( // 테마의 구성 요소를 담는 곳인듯? 
        //  상단 탭의 색을 정하는 부분
        //  colorScheme? 앱의 생삭 테마를 정의하는 부분
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), 
        //  Material3? 머터리얼 디자인의 최신 버전
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), 
      // 홈에 표시할 인스턴스, home 은 앱이 시작될 때 표시할 기본 화면을 지정
    );
  }
}

// StatefulWidget? : 동적 위젯 즉 버튼, 텍스트 필드, 체크박스 등 사용자 상태에 따라 변화해야 하는 구성 요소를 구성할 떄 사용
// 화면이 동작하는 동안 데이터 변경이 필요하거나, 사용자 상호 작용 이벤트에 따라 화면을 다시 그리고 변경된 부분을 반영한다.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // 부모 클래스의 속성 참조와 홈 페이지의 타이틀을 나타낸다

  final String title; // final 선언시 변경 불가능

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  // createState 메서드는 State 객체를 생성한다,
  // State객체? : 화면의 상태를 관리하고 상태 변화에 따라 화면을 다시 그린다
  // State<MyHomePage> createState() => _MyHomePageState(); 상속받아 구현한다는 뜻!
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() { //  Flutter 프레임워크에 상태 변경을 알릴 수 있도록, 상태가 변경되면 build가 호출되어 화면을 다시 구성한다
                  //  SwiftUI의 @State와 @Published 와 완전 비슷함
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //  Scafflod : Scafflod위젯은 앱의 기본 레이아웃을 제공한다. 앱 바, 본문, 플로팅 액션 버튼등의 주요 요소가 포함 가능하다.

      appBar: AppBar( // 앱의 제목을 표시하는 상단바
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // 없으면 색이 그려지지 않는다
        title: Text(widget.title),
      ),
      body: Center(
        //  레이아웃 위젯이라고 한다. 하나의 child와 포지션을 가진다.
        //  대충 부모뷰의 중간에 위치하나보다.

        child: Column(
          //  얘도 레이아웃 위젯이다.
          //  얘는 HStack처럼 상하구조로 하위 뷰를 가질 수 있나보다.
          //  이 녀석의 크기는 하위뷰에 딱 맞게 구성되는것 같으며, 상하로는 부모뷰와 딱 맞게 그려지나보다.
        
          mainAxisAlignment: MainAxisAlignment.center,
          //  Column이 가지는 속성인가보다. 

          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/**
요컨데 iOS의 View와 비슷한 느낌인것 같다. iOS의 View는 
- 'iOS 앱의 사용자 인터페이스를 구성하는 기본 요소.'
- '화면에 표시되는 텍스트, 이미지, 버튼, 리스트 등이 해당된다.'

다만 차이점이 있는데 둘의 차이점은 iOS의 View는
'
*/