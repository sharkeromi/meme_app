// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MemeDao? _memeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Meme` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `url` TEXT NOT NULL, `width` INTEGER NOT NULL, `height` INTEGER NOT NULL, `boxCount` INTEGER NOT NULL, `captions` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MemeDao get memeDao {
    return _memeDaoInstance ??= _$MemeDao(database, changeListener);
  }
}

class _$MemeDao extends MemeDao {
  _$MemeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _memeInsertionAdapter = InsertionAdapter(
            database,
            'Meme',
            (Meme item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'url': item.url,
                  'width': item.width,
                  'height': item.height,
                  'boxCount': item.boxCount,
                  'captions': item.captions
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Meme> _memeInsertionAdapter;

  @override
  Future<List<Meme>> getAllMeme() async {
    return _queryAdapter.queryList('SELECT * FROM Meme',
        mapper: (Map<String, Object?> row) => Meme(
            id: row['id'] as int,
            name: row['name'] as String,
            url: row['url'] as String,
            width: row['width'] as int,
            height: row['height'] as int,
            boxCount: row['boxCount'] as int,
            captions: row['captions'] as int));
  }

  @override
  Future<Meme?> getMemeById(int id) async {
    return _queryAdapter.query('SELECT * FROM Meme WHERE id=?1',
        mapper: (Map<String, Object?> row) => Meme(
            id: row['id'] as int,
            name: row['name'] as String,
            url: row['url'] as String,
            width: row['width'] as int,
            height: row['height'] as int,
            boxCount: row['boxCount'] as int,
            captions: row['captions'] as int),
        arguments: [id]);
  }

  @override
  Future<void> deleteMeme(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Meme WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Meme');
  }

  @override
  Future<void> insertMeme(Meme meme) async {
    await _memeInsertionAdapter.insert(meme, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertMemes(List<Meme> memes) {
    return _memeInsertionAdapter.insertListAndReturnIds(
        memes, OnConflictStrategy.abort);
  }
}
