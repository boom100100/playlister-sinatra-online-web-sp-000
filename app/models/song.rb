class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    #puts "Slug is #{slug}."

    song = Song.all.select {|song|
      song.slug == slug

    }
    song[0]
  end
end
