import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('quiz.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.path, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE perguntas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  enunciado $textType,
  respostaCorretaIndex $integerType,
  opcao1 $textType,
  opcao2 $textType,
  opcao3 $textType,
  opcao4 $textType
)
''');
  }

  Future<int> addPergunta(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('perguntas', row);
  }

  Future<int> deletePergunta(int id) async {
    final db = await database;
    return db.delete(
      'perguntas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Pergunta>> getPerguntas() async {
    final db = await instance.database;
    final result = await db.query('perguntas');
    return result.map((map) => Pergunta.fromMap(map)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

class Pergunta {
  int id;
  String enunciado;
  List<String> respostas;
  int respostaCorretaIndex;

  Pergunta({
    required this.id,
    required this.enunciado,
    required this.respostas,
    required this.respostaCorretaIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'enunciado': enunciado,
      'respostaCorretaIndex': respostaCorretaIndex,
      'opcao1': respostas[0],
      'opcao2': respostas[1],
      'opcao3': respostas[2],
      'opcao4': respostas[3],
    };
  }

  factory Pergunta.fromMap(Map<String, dynamic> map) {
    return Pergunta(
      id: map['id'],
      enunciado: map['enunciado'],
      respostas: [map['opcao1'], map['opcao2'], map['opcao3'], map['opcao4']],
      respostaCorretaIndex: map['respostaCorretaIndex'],
    );
  }
}
