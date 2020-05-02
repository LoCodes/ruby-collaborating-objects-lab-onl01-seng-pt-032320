# Song
#   #initialize with a name
#     accepts a name for the song and makes it accessible through an attribute accessor (FAILED - 11)
#   #name=
#     sets the song name (FAILED - 12)
#   #artist=
#     sets the artist object to belong to the song (FAILED - 13)
#   .all
#     returns all existing Song instances (FAILED - 14)
#   .new_by_filename
#     creates a new instance of a song from the file that's passed (FAILED - 15)
#     associates new song instance with the artist from the filename (FAILED - 16)
#   #artist_name=
#     accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute (FAILED - 17)

require 'pry'

class Song
  attr_accessor :name, :artist     #name= - sets the song name
                                  #artist= sets the artist object to belong to the song
  @@all = []

  # #initialize with a name
  #   accepts a name for the song and makes it accessible through an attribute accessor

  def initialize(name)
    @name = name
    @artist = artist
    @@all << self
  end

  def self.all
    @@all
  end

  # .new_by_filename
  #  creates a new instance of a song from the file that's passed (FAILED - 8)
  #  associates new song instance with the artist from the filename (FAILED - 9)

  def self.new_by_filename(filename)
    song = filename.chomp(".mp3").split(" - ")
    new_song = self.new(song)
    new_song.artist = Artist.find_or_create_by_name(name)
    #binding.pry
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song
  end
end
