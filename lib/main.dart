import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          body: Todo(),
      ) ,
    );
  }
}
//calculator app
class Todo extends StatefulWidget {

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
     var result="";
     clear(){
       setState((){
     result=" ";
   }); }
   output1(){
     Parser p=Parser();
     Expression exp=p.parse(result);

ContextModel cm= ContextModel();

 double eval=exp.evaluate(EvaluationType.REAL, cm);
 setState((){
     result =eval.toString();
   });
   
   
       
     }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      home: Scaffold(
        
       appBar: AppBar(title: Center(child: Text("Calculator App")),) ,
       body: Container(
          color: Colors.black,
           child:  Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(result ,style: TextStyle(color: Colors.white,fontSize:30, fontWeight:FontWeight.bold),),
                 
                 Row(
                   mainAxisAlignment:MainAxisAlignment.spaceAround,
                   children: [
                     btn("1"),
                    btn("2"),
                    btn("3"),
                    btn("4"),
                          ],),
                          SizedBox(height:10),
                     Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                   children: [
                     btn("5"),
                    btn("6"),
                    btn("7"),
                    btn("8"),
                          ],
                     ),
                      SizedBox(height:10),
                      Row(
                           mainAxisAlignment:MainAxisAlignment.spaceAround,
                   children: [
                     btn("9"),
                    btn("0"),
                    btn("*"),
                    btn("+"),
                          ],
                     ),
                      SizedBox(height:10),
                      Row(
                           mainAxisAlignment:MainAxisAlignment.spaceAround,
                   children: [
                     btn("/"),
                    btn("-"),
                  ElevatedButton(onPressed: clear, child:Text("Clr"),),
                   ElevatedButton(onPressed:output1, child:Text("="),),
                          ],
                     )
                  
                 


             ],),
           ),
         ),
      
    );
  }
  Widget btn(var data){
  return
 ElevatedButton(onPressed: (){
   setState((){
     result+=data;
   });
 }, child:Text(data),);
  



}
}
