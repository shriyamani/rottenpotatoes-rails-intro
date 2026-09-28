class Movie < ApplicationRecord
  def self.all_ratings
    return ['G','PG','PG-13','R']
  end

  def self.with_ratings(ratings)
    if ratings == nil
      return Movie.all
    end
    
    lowercase_ratings = []
    ratings.each do |r|
      lowercase_ratings.push(r.downcase)
    end
    
    return Movie.where('LOWER(rating) IN (?)', lowercase_ratings)
  end
end
