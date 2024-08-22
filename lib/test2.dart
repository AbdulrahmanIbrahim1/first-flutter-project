import 'package:flutter/material.dart';


class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('wrap' ,
          style:TextStyle(
            color: Colors.white,
            fontSize: 40
          ) ,
        ),
        centerTitle: true,
      ),
      // =====================
      //grid view 
      // body: GridView.count(
      //     crossAxisCount: 3,
      //   children:
      //     List.generate(10, (index){
      //       return Center(
      //         child: Container(
      //           height: 100,
      //           width: 100,
      //           color: Colors.red,
      //           margin: EdgeInsets.all(4),
      //           child: Center(
      //             child: Text('item is : $index',style: TextStyle(
      //               color: Colors.white
      //              ),
      //             ),
      //           ),
      //         ),
      //       );
      //     })
      // ),
      // ===============================================
      //

      //==========
      // grid view .builder
      // body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2
      // ),
      //     itemCount: 10
      //     , itemBuilder: (context, index){
      //   return Card(
      //     color: Colors.red,
      //     child: Center(
      //       child: Text('Abdo $index'),
      //     ),
      //   );
      //   },
      // ),
    //   ========================

    //   body: Wrap(
    //     spacing: 10.0,
    //     runSpacing: 10.0,
    //     children:
    //       List.generate(20, (index){
    //         return Chip(
    //             label: Text('abdo $index',)
    //         );
    //       }),
    //   ),


    );
  }
}
