class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.length
  end

  def artist_count
    artists = self.songs.map { |song| song.artist }
    artists.uniq.length
  end

  def all_artist_names
    artists = self.songs.map { |song| song.artist.name }
    artists.uniq
  end
end
