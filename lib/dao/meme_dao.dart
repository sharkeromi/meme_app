import 'package:floor/floor.dart';
import 'package:meme_app/entity/meme.dart';

@dao
abstract class MemeDao {
  @Query('SELECT * FROM Meme')
  Stream<List<Meme>> getAllMeme();

  @Query('SELECT * FROM Meme WHERE id=:id')
  Stream<Meme?> getMemeById(String id);

  @delete
  Future<void> deleteMeme(Meme meme);
}
