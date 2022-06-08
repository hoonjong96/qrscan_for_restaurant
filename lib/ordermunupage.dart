import 'package:flutter/material.dart';
import 'package:get/get.dart';

/** 2022-06-01 23:22 jongdroid
 * 해당 페이지는 블 번메인 페이지에서 큐알 스캔을 통해 받아온 테이호로 메뉴를 주문하는 페이지 입니다. (실제 매장 주문 불가)
 * 상태관리 학습을 위한 프로젝트로 장바구니 기능을 추가할 예정입니다.
 */

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({Key? key}) : super(key: key);

  @override
  State<OrderMenuPage> createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> {
  var tableNum = Get.arguments; //main으로 부터 얻어온 테이블 번호

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('$tableNum번 테이블 입니다.'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                print('카트가 클릭되었습니다.');
              },
              color: Colors.red,),

          ],
          centerTitle: true,
        ),
        body: Container(
          child: MenuList(),
        ),
      ),
    );
  }
}

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  // 리스트 제목 = 음식 이름
  var foodNameList = ['짜장면', '짬뽕', '볶음밥', '짬짜면',  '탕수육'];
  // 리스트 부제목 = prize
  var foodPrizeList = [200, 300, 200, 300, 500];
  // leading = 음식 image
  var foodImageList = ['image1.jpeg', 'image2.jpeg', 'image3.jpeg', 'image4.jpeg', 'image5.jpeg' ];

  bool checkCartItem = false;

  List<int> like = [0,0,0,0,0];

  List<Icon> item = [Icon(Icons.remove_shopping_cart), Icon(Icons.remove_shopping_cart),
    Icon(Icons.remove_shopping_cart), Icon(Icons.remove_shopping_cart) , Icon(Icons.remove_shopping_cart)];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foodNameList.length,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text( '${foodNameList[index]}'),
          subtitle: Text( '${foodPrizeList[index]}원'),
          leading: SizedBox( width: 45, height: 45,
              child: Image.asset('image/${foodImageList[index]}')
          ),
          trailing: item[index],
          // trailing: Icon(
          //   checkCartItem ? Icons.shopping_cart : Icons.shopping_cart_outlined,
          //   color: checkCartItem ? Colors.red : null,
          // ),
          onTap: () {
            checkCartItem = !checkCartItem;
            if (checkCartItem == true) {
              item[index] = Icon(Icons.shopping_cart, color: Colors.red,);
              print('$index 번째 아이템을 클릭하였습니다.');
            }
            else if(checkCartItem == false) {
              item[index] = Icon(Icons.remove_shopping_cart);
            }
            setState(() {
            });
          },
        );
      },
      separatorBuilder: (context, int index) => Divider(),
    );
  }
}
