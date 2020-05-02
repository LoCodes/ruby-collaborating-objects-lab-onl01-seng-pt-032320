# Artist
#   #initialize with #name
#     accepts a name for the artist (FAILED - 1)
#   #name=
#     sets the artist name (FAILED - 2)
#   .all
#     returns all existing Artist instances (FAILED - 3)
#   #add_song
#     keeps track of an artist's songs (FAILED - 4)
#   #songs
#     lists all songs that belong to this artist (FAILED - 5)
#   .find_or_create_by_name
#     always returns an Artist instance (FAILED - 6)
#     finds or creates an artist by name maintaining uniqueness of objects by name property (FAILED - 7)
#     Creates new instance of Artist if none exist (FAILED - 8)
#   #print_songs
#     lists all of the artist's songs (FAILED - 9)

require 'pry'

class Artist

  attr_accessor :name, :song

  @@all = []


  def initialize(name)  #initialize with #name - accepts a anme for the artist
    @name = name
    @@all << self
  end

  def self.all               # .all - returns all existing Artist instances
    @@all
  end

  def add_song(song)        #  keeps track of an artist's songs
    song.artist = self
    binding.pry
    #song.push(song)
  end

  def songs                 # song - lists all songs that belong to this artist
    #Song.find_by_artist(self)
    Song.all.select {|song| song.artist == self}
  end

  # .find_or_create_by_name
  #  always returns an Artist instance
  #  finds or creates an artist by name maintaining uniqueness of objects by name property
  #  Creates new instance of Artist if none exist

  def self.find_or_create_by_name(name)
     #self.all.find {|artist| artist.name == name} || Artist.new(name).tap { |art| art.save }
     self.all.find {|artist| artist.name == name} || self.create(name)
     #this is a class method. we call find or create by name on the artist class itself
     #the self within the class method refers to the class itself. its the same as saying
     #Artist.all.find.


  end
  def self.create(name) #class method
    song = self.new(name)
    #here self refers to Artist. same as Artist.new
    #the temporary variable is song. we can refernce this instance in the future with its other attributes
    #even if we don't have the instance saved into a variable name like hot_line_bling. doing that would just add an extra step
    song.tap {|x| x.save}
  end

  # def self.create(name)
  #   self.new(name).create {|artist| artist.save}
  # end

  def save
    self.class.all << self   # better to use this method incase of changes
    #@@all << self           # if used this method and makes changes you have to find all the @@all to change
  end

  # #print_songs
  #  lists all of the artist's songs

  def print_songs
    self.songs.each {|song| puts song.name}
  end
end
