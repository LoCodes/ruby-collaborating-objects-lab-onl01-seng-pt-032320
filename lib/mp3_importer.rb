# MP3Importer
#   #initialize
#     accepts a file path to parse mp3 files from (FAILED - 7)
#   #files
#     loads all the mp3 files in the path directory (FAILED - 8)
#     normalizes the filename to just the mp3 filename with no path (FAILED - 9)
#   #import
#     imports the files into the library by creating songs from a filename (FAILED - 10)


class MP3Importer
  attr_accessor :path

  def initialize(path)  #initialize - accepts a file path to parse mp3 files from
    @path = path
  end

  # #files
  #  loads all the mp3 files in the path directory
  #  normalizes the filename to just the mp3 filename with no path

  # .gsub method 

  def files
    @files ||= Dir.glob("#{path}/*.mp3").map{ |file| file.gsub("#{path}/", "") }
  end

  # #import
  #  imports the files into the library by creating songs from a filename

  def import
    files.each{|file| Song.new_by_filename(file)}
  end
end
