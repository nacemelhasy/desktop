import 'package:desktop/pages/members.dart';
import 'package:get/get.dart';

class Database extends GetxController {
  List<Map> members = [];
  void addMember(Map m) {
    members.add(m);
    update();
  }


  void deleteMember(name){
    for(int i = 0 ;i<members.length;i++){

      if(members[i]['name'] == name){
        // ignore: list_remove_unrelated_type
        members.remove(i);
      }
    }
      update();
    
  }
}
