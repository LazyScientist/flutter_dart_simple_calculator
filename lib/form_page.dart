import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';



class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var calculations = "";
  var cal_answer = "answer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            // decoration: BoxDecoration(
            //             image: DecorationImage(image: AssetImage("lib/background.png"),fit: BoxFit.cover)
            // ),


          child: Column(
              children: [
                Container(

                  // width: double.infinity,
                  alignment: Alignment.centerRight,

                    child: Row(
                      children: [
                        Text(
                            calculations,
                            style: TextStyle(
                              fontSize: 90,
                              color: Colors.black45,
                              fontWeight: FontWeight.w700,)),



                      ],
                    ),
                ),


                Container(
                  alignment: Alignment.centerRight,
                  child: Card(

                    // children: [
                      child: Text(

                          cal_answer,
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black26,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,

                              shadows: [
                                Shadow(color: Colors.white38, offset: Offset(2,1), blurRadius:10),])),
                    // ],
                  ),
                ),





              Expanded(child: Container(

                child: GridView.count(crossAxisCount: 4,


                  children: [



                    OutlinedButton(
                        child: Text('C',style: TextStyle(fontSize: 80),),
                        // style: TextStyle(
                        //
                        // ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: (){
                          setState(() {calculations = "";
                                    cal_answer="0";});
                        }

                    ),

                    OutlinedButton(
                        child: Text('/',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"/";});}
                    ),
                    OutlinedButton(
                        child: Text('x',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"x";});}
                    ),


                    IconButton(
                      alignment: Alignment.centerRight,
                      iconSize: 100,
                      icon: Icon(Icons.backspace),
                      onPressed:() { setState(() {

                        calculations = calculations.substring(0, calculations.length - 1);

                      }); },),


                    OutlineButton(
                        child: Text('1',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"1";});}
                    ),
                    OutlineButton(
                        child: Text('2',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"2";});}
                    ),
                    OutlineButton(
                        child: Text('3',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"3";});}
                    ),
                    OutlinedButton(
                        child: Text('-',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"-";});}
                    ),
                    OutlineButton(
                        child: Text('4',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"4";});}
                    ),
                    OutlineButton(
                        child: Text('5',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"5";});}
                    ),
                    OutlineButton(
                        child: Text('6',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"6";});}
                    ),
                    OutlinedButton(
                        child: Text('+',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"+";});}
                    ),


                    OutlineButton(
                        child: Text('7',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"7";});}
                    ),
                    OutlineButton(
                        child: Text('8',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"8";});}
                    ),
                    OutlineButton(
                        child: Text('9',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"9";});}
                    ),
                    OutlinedButton(
                        child: Text('%',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"%";});}
                    ),
                    OutlineButton(
                        child: Text('.',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +".";});}
                    ),
                    OutlineButton(
                        child: Text('0',style: TextStyle(fontSize: 80),),
                        onPressed: (){setState(() {calculations = calculations +"0";});}
                    ),
                    OutlineButton(
                        child: Text('00',style: TextStyle(fontSize: 40),),
                        onPressed: (){setState(() {calculations = calculations +"00";});}
                    ),
                    FloatingActionButton(
                        child: Text('=',style: TextStyle(fontSize: 80),),
                        elevation: 5,
                        onPressed: (){

                          equalPressed();

                        }
                    ),






                  ],


                ),
              ))


















              ],

          )
          ),
    );
  }




  void equalPressed() {
    String finaluserinput = calculations;
    finaluserinput = calculations.replaceAll('x', '*');
    print("pressed");

    try{

      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      cal_answer = eval.toString();
      setState(() {calculations = "";});
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please , fill it properly")));

    }

  }

}
