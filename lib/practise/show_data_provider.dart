import 'package:flutter/material.dart';
import 'package:mynewapp/practise/update_provider_notes.dart';
import 'package:provider/provider.dart';
import 'list_provider_fn.dart';

class notes_desc extends StatelessWidget {
  int categ;

  notes_desc({required this.categ});


  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mNotes = Provider.of<ListProvider>(context).fetchSNotes(mid: categ);
    print(mNotes);
    return mNotes.isNotEmpty?Scaffold(
      backgroundColor: Color(0xff252525),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff3b3b3b),
                            borderRadius: BorderRadius.circular(11)),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.white,
                            ))),
                    Container(
                        height: 50,
                        width: 110,
                        child: Row(
                          children: [
                          Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff3b3b3b),
                              borderRadius: BorderRadius.circular(11)),
                          child:InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>updateNote(categ: categ)));
                                  /* showModalBottomSheet(
                                      isScrollControlled: true,
                                      enableDrag: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
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
                                                              Navigator.pop(
                                                                  context);
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
                                                                  nid: mNotes[0]
                                                                  ["note_id"]);
                                                              Navigator.pop(
                                                                  context);
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
                                            ));
                                      }); */
                                },
                                child: Icon(
                                  Icons.edit_note_outlined,
                                  color: Colors.white,
                                ))),
                          SizedBox(width: 10,),
                          Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff3b3b3b),
                              borderRadius: BorderRadius.circular(11)),
                          child:InkWell(
                                onTap: () {
                                  Provider.of<ListProvider>(context, listen: false).delete_note(nid: categ);
                                  Navigator.of(context).pop();
                                  },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ))),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              mNotes.isNotEmpty
                  ? Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (mNotes['note_title'] != '')
                          ? mNotes['note_title'].toString()
                          : '',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      mNotes['created_date'].toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      mNotes['note_desc'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )
                  : Center(
                child: Text(
                  "Loading....",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ):Container();
  }
}
