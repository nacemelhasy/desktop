import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Sqflite{

// for manpliation at database and access on it 
static Database? _db ;

 Future<Database?> get db async{

if(_db == null){
_db = await initalDb();
return _db;
}else{
return _db;
}


}




initalDb() async {

// String databasePath  = await getDatabasesPath();// for get path for save database in phone 
// [ HINT ] below line for android app
// String path = join(databasePath,'engineering.db');// for name database and join for merge path and name data base'

String path = join('D:/desktop','engineering.db');// for windos

Database db = await openDatabase(path,onCreate: _createDb,version:1 );// when create database will listen _createDb funcation

return db ;
}
//[HINT] oncreate databse will run only in create data in first then not run



_createDb(Database db,int v)async{
// here write sql commend for create table or anything
await db.execute(
  '''
CREATE TABLE "members" (
  id INTEGER PRIMARTY KEY  NOT NULL AUTOINCREMENT,
  name TEXT,
  department TEXT
)
'''
);
print('crate database ============================');
}

// for select qure sql from database

readDb(String sql)async{

Database? myDb = await db ;
List<Map> response = await myDb!.rawQuery(sql);
return response;
}


// for delete form databse 
deleteDb(String sql)async{

Database? myDb = await db ;
int response = await myDb!.rawDelete(sql);
return response;
}

// for insert at database
insertDb(String sql)async{

Database? myDb = await db ;
int response = await myDb!.rawInsert(sql);
return response;
}


// for update at database
updteDb(String sql)async{

Database? myDb = await db ;
int response = await myDb!.rawUpdate(sql);
return response;
}

}


// [ HINT ] 
// 1 - if you want to add another table in database use onUpgrade and change version becuase onCreta will run only first time


