import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/practise/list_provider_fn.dart';
import 'package:provider/provider.dart';

class updateNote extends StatelessWidget {
  int categ;

  updateNote({required this.categ}); 
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mNotes =  Provider.of<ListProvider>(context).fetchSNotes(mid: categ);
    print(mNotes);
    titleController.text = mNotes.isNotEmpty?mNotes['note_title'].toString():'';
    descController.text = mNotes.isNotEmpty?mNotes['note_desc'].toString():'';

    return Scaffold(
      body: mNotes.isNotEmpty?Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff252525)),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color:
                        Color(0xff3b3b3b),
                        borderRadius:
                        BorderRadius
                            .circular(11)),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons
                              .arrow_back_ios_sharp,
                          color: Colors.white,
                        ))),
                Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        color:
                        Color(0xff3b3b3b),
                        borderRadius:
                        BorderRadius
                            .circular(11)),
                    child: InkWell(
                        onTap: () {
                          Provider.of<ListProvider>(context, listen: false).updateNotes(
                              mtitle:
                              titleController
                                  .text,
                              mdesc:
                              descController
                                  .text,
                              nid: categ);
                          Navigator.pop(context);
                        },
                        child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color:
                                  Colors.white,
                                  fontSize: 20,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            )))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              minLines: 3,
              maxLines: 3,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40),
              controller: titleController,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 40,
                      color: Colors.grey),
                  hintText: "Title",
                  enabledBorder:
                  OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder:
                  OutlineInputBorder(
                      borderSide:
                      BorderSide.none)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              minLines: 3,
              maxLines: 10,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
              controller: descController,
              decoration: InputDecoration(
                  hintText: "Type Something...",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey),
                  enabledBorder:
                  OutlineInputBorder(
                      borderSide: BorderSide
                          .none),
                  focusedBorder:
                  OutlineInputBorder(
                      borderSide:
                      BorderSide.none)),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ):Container(),
    );
  }

}