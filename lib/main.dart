import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  home: Calc(),
));
class Calc extends StatefulWidget {


  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {

  String output="0";
  String output1="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  buttonpressed(String text)
  {
     if(text=="C")
       {
          output1="0";
       num1=0.0;
          num2=0.0;
          operand="";
       }
     else if(text=="+" || text=="/" || text=="*" || text=="-")
       {
         num1=double.parse(output);
         operand=text;
           output1="0";
           setState((){

           });


       }
     else if(text=="."){
       if(output1.contains(".")){
         print("Already there");
       }
       else
         {
           output1=output1+text;
         }
     }
     else if(text=="=")
       {
         num2=double.parse(output);
         if(operand=="+")
           {
             output1=(num1+num2).toString();
           }
       else  if(operand=="-")
         {
           output1=(num1-num2).toString();
         }
       else  if(operand=="*")
         {
           output1=(num1*num2).toString();
         }
       else  if(operand=="/")
         {
           output1=(num1/num2).toString();
         }
        num1=0.0;
       num2=0.0;
       operand="";
       }
     else
     {
       output1=output1+text;
     }
     print(output1);
     setState((){
       output=double.parse(output1).toStringAsFixed(2);
     });

  }
  Widget buildbutton(String text,int n)
  {    if(n==0)
    {
      return  Expanded(

        child: MaterialButton(
          padding:  const EdgeInsets.all(18.0),
          onPressed: ()=>
            buttonpressed(text)
          ,
          color:Colors.white,
          child:Text(text
            ,style: const TextStyle(
                fontSize: 24.0



            ),
          ),
        ),
      );
    }
    else
      {
        return  Expanded(

          child: MaterialButton(
            padding:  const EdgeInsets.all(18.0),
            onPressed: ()=>buttonpressed(text),
            color:Colors.white,
            child:Text(text
              ,style: const TextStyle(
                  fontSize: 24.0,
                color: Colors.orange,



              ),
            ),
          ),
        );
      }






  }
  Widget buildbutton1()
  {
    return  Expanded(

      child: MaterialButton(
        padding:  const EdgeInsets.all(18.0),
        onPressed: ()=>{},
        color: Colors.orange,
         child: const Icon(Icons.cancel,
         ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Calculator",
              style: TextStyle(
                // color: Colors.red,
                fontSize: 20.0,
              ),
            ),
            backgroundColor: Colors.blue,
            centerTitle: true,
                 
          ),
      body: Container(
        child: Column
          (
          children: [
            Container(
              alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(
                  vertical: 120.0,
                  horizontal: 20.0,
                ),
                child: Text(output,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),

            )),

            Expanded(child: Divider()),
            Column(
              children: [
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.end

                    children: [
                      buildbutton('C',1),
                      buildbutton1(),
                      buildbutton('%',1),
                      buildbutton('/',1),




                    ]
                ),
                Row(
                //  mainAxisAlignment: MainAxisAlignment.end

                  children: [
                        buildbutton('7',0),
                    buildbutton('8',0),
                    buildbutton('9',0),
                    buildbutton('*',1),




                    ]
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.end

                    children: [
                      buildbutton('4',0),
                      buildbutton('5',0),
                      buildbutton('6',0),
                      buildbutton('-',1),




                    ]
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.end

                    children: [
                      buildbutton('1',0),
                      buildbutton('2',0),
                      buildbutton('3',0),
                      buildbutton('+',1),




                    ]
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.end

                    children: [

                      buildbutton('0',0),
                      buildbutton('.',1),

                      buildbutton('=',1),




                    ]
                ),


              ],
            )
          ],
        ),
      ),

    );
  }
}

