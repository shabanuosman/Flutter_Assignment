import 'package:flutter/material.dart';

final double screenBorderRadius = 20.0;
final String question1 =
    "Given the choice of anyone in the world, whom would you want as a dinner guest?";
final String question2 =
    " If a crystal ball could tell you the truth about yourself, your life, the future or anything else, what would you want to know?";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          child: Container(
            decoration: BoxDecoration(  
              border: Border.all(width: 1.0, color: Colors.black),
              borderRadius: BorderRadius.circular(screenBorderRadius),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(screenBorderRadius),
                child: QuestionPage()),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildContactBar(context),
        buildPromptHeaderText(context),
        buildQuestionCard(context, question1, Colors.amber),
        
        buildQuestionCard(context, question2, Colors.purpleAccent),
        buildPromptHeaderSubtitleText(context),
        Expanded(child: Container()),
        buildCallControls(context),
      ],
    );
  }

  Widget buildContactBar(BuildContext context) {
    // IMPLEMENT

    return Container(
      constraints: BoxConstraints(maxHeight: 120),
      decoration: BoxDecoration(color: Colors.blue),
       padding: EdgeInsets.fromLTRB(25, 35, 35, 15),
       
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildUserColumn(context, buildIcon(Icons.face, Colors.purple , 50),'Hannah'),
          buildUserColumn(context, buildIcon(Icons.face, Colors.green, 50),'chad'),
        ],
      ),
    );
  }

  Widget buildIcon(IconData iconData, Color color, double size) {
    return  Icon(iconData, size: size, color: color);
  }



  Widget buildUserColumn(BuildContext context, Widget icon, String userName) {
    return Column(
          children: [
            icon,
            Container(
              child: Text(userName),
            )
          ],

        );
  }

  Widget buildPromptHeaderText(BuildContext context) {
    // IMPLEMENT
    return Container(
        padding: EdgeInsets.all(20),
        child:Text("Your turn to pick a question!"),
           
    );
  }

  Widget buildPromptHeaderSubtitleText(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child:Text("Relax, you're doing great."));
  }

  Widget buildQuestionCard(BuildContext context, String question, Color color) {
    // IMPLEMENT
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
     
       children:[
         Card(
           child:Container(
           padding:EdgeInsets.all(10),
           height:100,
           width:300,
           decoration:BoxDecoration(color:color),
           child:Text(question,
                     style:TextStyle(color:Colors.white)))
         )
    
       ]);
    
  }

  Widget buildCallControls(BuildContext context) {
    // IMPLEMENT
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [buildIcon(Icons.volume_mute,Colors.black, 45)]
          ),
          Column(
              children: [buildIcon(Icons.call_end_rounded,Colors.red, 45)]
          ),
          Column(
              children: [buildIcon(Icons.volume_up_sharp,Colors.black, 45)]
          ),
        ],
      )
    );
  }
}
