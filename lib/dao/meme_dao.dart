import 'package:floor/floor.dart';
import 'package:meme_app/entity/meme.dart';

@dao
abstract class MemeDao {
  @Query('SELECT * FROM Meme')
  Future<List<Meme>> getAllMeme();

  @Query('SELECT * FROM Meme WHERE id=:id')
  Future<Meme?> getMemeById(String id);

  @insert
  Future<List<int>> insertMeme(List<Meme> meme);

  @Query('DELETE FROM Meme WHERE id = :id')
  Future<void> deleteMeme(int id);

  @Query('DELETE FROM Meme')
  Future<void> deleteAll();
}

//flutter packages pub run build_runner build