import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/practise/list_provider_fn.dart';
import 'package:provider/provider.dart';

class createNote extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff252525)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Color(0xff3b3b3b), borderRadius: BorderRadius.circular(11)),
                        child:
                        InkWell(onTap: (){ Navigator.pop(context); },child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,))),

                    Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(color: Color(0xff3b3b3b), borderRadius: BorderRadius.circular(11)),
                        child:
                        InkWell(onTap: (){
                          DateTime nowt = new DateTime.now();
                          int note_id = nowt.day+nowt.hour+nowt.minute+nowt.second;
                          print(note_id);
                          print("sdsdsd");
                          Provider.of<ListProvider>(context,listen: false).addNotes(mtitle: titleController.text, mdesc: descController.text, nid: note_id);
                          Navigator.pop(context);
                          },child: Center(child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)))),
                  ],
                ),
                SizedBox(height: 20,),
                TextField(
                  style: TextStyle(color: Colors.white, fontSize: 40 ),
                  controller: titleController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 40, color: Colors.grey),
                      hintText: "Title",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  minLines: 3,
                  maxLines: 6,
                  style: TextStyle(color: Colors.white, fontSize: 20 ),
                  controller: descController,
                  decoration: InputDecoration(
                      hintText: "Type Something...",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none
                      )
                  ),
                ),
                SizedBox(height: 20,),
              ],
            )
        ),
      ),
    );
  }

}