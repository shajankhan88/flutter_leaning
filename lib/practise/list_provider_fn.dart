import 'package:flutter/widgets.dart';

class ListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mNotes = [];

  void addNotes({required String mtitle,required String mdesc,required int nid}) {

    DateTime now = new DateTime.now();
    int montth = now.month; String monthname = '';

    if(montth==01)
      monthname = 'Jan';
    else if(montth==02)
      monthname = 'Feb';
    else if(montth==03)
      monthname = 'Mar';
    else if(montth==04)
      monthname = 'Apr';
    else if(montth==05)
      monthname = 'May';
    else if(montth==06)
      monthname = 'Jun';
    else if(montth==07)
      monthname = 'Jul';
    else if(montth==08)
      monthname = 'Aug';
    else if(montth==09)
      monthname = 'Sep';
    else if(montth==10)
      monthname = 'Oct';
    else if(montth==11)
      monthname = 'Nov';
    else if(montth==12)
      monthname = 'Dec';

    String monname = monthname+' '+(now.day).toString()+', '+(now.year).toString();

    _mNotes.add({
      'note_title' : mtitle,
      'note_desc' : mdesc,
      'note_id' : nid,
      'created_date' : monname
    });
    notifyListeners();
  }

  List<Map<String, dynamic>> fetchNotes() {
    return _mNotes;
  }

  Map<String, dynamic> fetchSNotes({required int mid}) {
    return _mNotes[mid];

  }

  void updateNotes({required String mtitle,required String mdesc, required nid}) {

    DateTime now = new DateTime.now();
    int montth = now.month; String monthname = '';

    if(montth==01)
      monthname = 'Jan';
    else if(montth==02)
      monthname = 'Feb';
    else if(montth==03)
      monthname = 'Mar';
    else if(montth==04)
      monthname = 'Apr';
    else if(montth==05)
      monthname = 'May';
    else if(montth==06)
      monthname = 'Jun';
    else if(montth==07)
      monthname = 'Jul';
    else if(montth==08)
      monthname = 'Aug';
    else if(montth==09)
      monthname = 'Sep';
    else if(montth==10)
      monthname = 'Oct';
    else if(montth==11)
      monthname = 'Nov';
    else if(montth==12)
      monthname = 'Dec';

    String monname = monthname+' '+(now.day).toString()+', '+(now.year).toString();

    _mNotes[nid] = ({
      'note_title' : mtitle,
      'note_desc' : mdesc,
      'note_id' : nid,
      'created_date' : monname
    });
    notifyListeners();
  }

  void delete_note({required int nid}) {
    _mNotes.removeAt(nid);
    notifyListeners();
  }
}