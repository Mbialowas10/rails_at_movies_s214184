class Movie < ApplicationRecord
  belongs_to :production_company
  validates :title, :year, :duration, :description, :average_vote, presence: true

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  def genres_list
    genres.map(&:name).join(", ")
  end
end
