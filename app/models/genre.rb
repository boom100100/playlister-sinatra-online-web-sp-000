class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    puts "Slug is #{slug}."

    genre = Genre.all.select {|genre|
      genre.slug == slug

    }
    genre[0]
  end
end
