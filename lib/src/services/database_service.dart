import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  DatabaseService._();
  static final DatabaseService instance = DatabaseService._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // 初始化桌面平台的SQLite
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    // 获取数据库路径
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final dbPath = join(documentsDirectory.path, 'refuge_next', 'game_logs.db');

    // 确保目录存在
    final dbDirectory = Directory(dirname(dbPath));
    if (!await dbDirectory.exists()) {
      await dbDirectory.create(recursive: true);
    }

    // 打开数据库
    return await openDatabase(
      dbPath,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // 创建游戏日志表
    await db.execute('''
      CREATE TABLE game_logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp INTEGER NOT NULL,
        log_level TEXT NOT NULL,
        log_type TEXT NOT NULL,
        sub_type TEXT,
        player_id TEXT,
        player_name TEXT,
        request_id INTEGER,
        entity_id TEXT,
        entity_name TEXT,
        entity_class TEXT,
        location TEXT,
        inventory_id TEXT,
        action TEXT,
        result TEXT,
        elapsed REAL,
        content TEXT NOT NULL,
        parsed_data TEXT,
        account TEXT
      )
    ''');

    // 创建索引以优化查询性能
    await db.execute('CREATE INDEX idx_timestamp ON game_logs(timestamp)');
    await db.execute('CREATE INDEX idx_player_id ON game_logs(player_id)');
    await db.execute('CREATE INDEX idx_log_type ON game_logs(log_type)');
    await db.execute('CREATE INDEX idx_request_id ON game_logs(request_id)');
    await db.execute('CREATE INDEX idx_entity_id ON game_logs(entity_id)');

    // 创建唯一索引防止重复日志
    await db.execute('CREATE UNIQUE INDEX idx_unique_log ON game_logs(timestamp, content)');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // 处理数据库升级
    if (oldVersion < 2) {
      // 升级到v2：添加唯一索引防止重复日志
      await db.execute('CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_log ON game_logs(timestamp, content)');
    }
    if (oldVersion < 3) {
      // 升级到v3：添加account字段
      await db.execute('ALTER TABLE game_logs ADD COLUMN account TEXT');
    }
  }

  // 关闭数据库连接
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}