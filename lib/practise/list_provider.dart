import 'package:flutter/material.dart';
import 'package:mynewapp/practise/create_provider.dart';
import 'package:mynewapp/practise/list_provider_fn.dart';
import 'package:provider/provider.dart';
import 'show_data_provider.dart';
import 'dart:math';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=>ListProvider(), child: MyApp(),));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(), //ChangeNotifierProvider(create:(context)=>ListProvider(), child:HomePage()), //HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  List colors = [Color(0xffffab91), Color(0xffffcc80), Color(0xffe6ee9b), Color(0xff80deea), Color(0xffcf93d9), Color(0xfff48fb1), Color(0xff80cbc4), Color(0xffffab91), Color(0xffffcc80), Color(0xffe6ee9b), Color(0xff80deea), Color(0xffcf93d9), Color(0xfff48fb1), Color(0xff80cbc4)];
  Random random = new Random();

  @override
  Widget build(BuildContext context){
    List<Map<String, dynamic>> _mNotes = Provider.of<ListProvider>(context).fetchNotes();

    return Scaffold(
      backgroundColor: Color(0xff252525),
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notes", style: TextStyle(color: Colors.white, fontSize: 35),),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Color(0xff3b3b3b),
                    ),
                    child: Icon(IconData(0xe567, fontFamily: 'MaterialIcons'), size: 35, color: Colors.white,),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child:
                _mNotes.isNotEmpty ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 2/2,  ),
                    itemCount: _mNotes.length,
                    itemBuilder: (_, index){
                      return  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 5),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: colors[index],
                          ),
                          child: InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>notes_desc(categ:index)));
                          },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_mNotes[index]["note_title"], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                                Text(_mNotes[index]["created_date"].toString(), style: TextStyle(color: Color(0xff595555), fontSize: 16,fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                        ),
                      );
                      /* return  ListTile(
                    title: Text(mNotes[index]["note_title"]),
                    subtitle: Text(mNotes[index]["note_desc"]),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){dbHelper.updateNote(title:'shajan',desc:'changed Text',note_id:mNotes[index]["note_id"]); getNotes();}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){dbHelper.deleteNote(note_id:mNotes[index]["note_id"]); getNotes();}, icon: Icon(Icons.delete, color: Colors.red,)),
                        ],
                      ),
                    ),
                  ); */
                    }):Center(child: Text('No notes yet!!'),),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>createNote()));
        /*titleController.text = "";
        descController.text = '';
        showModalBottomSheet(
          isScrollControlled: true,
            enableDrag: false,
            context: context, builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff252525)
              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
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
                            dbHelper.addNote(title: titleController.text, desc: descController.text);
                            getNotes();
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
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(onPressed: () {
                        /// add note
                        dbHelper.addNote(title: titleController.text, desc: descController.text);
                        getNotes();
                        Navigator.pop(context);
                      }, child: Text("Add Notes")),
                      ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                      },child: Text("Cancel", style: TextStyle(
                        color: Colors.black87,
                      ),) ,)
                    ],
                  ) */

                ],
              )
          );
        }
        ); */
      }, child: Icon(Icons.add),),
    );
  }
}