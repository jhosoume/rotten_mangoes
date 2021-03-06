class Movie < ActiveRecord::Base
  include MoviesHelper

  mount_uploader :poster_image, PosterImageUploader

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  scope :title, -> (title) do 
    where("title LIKE ?", "%#{title}%") 
  end

  scope :director, -> (director) do 
    where("director LIKE ?", "%#{director}%") 
  end

  scope :by_title_or_director, -> (phrase) do 
    where("title LIKE ? OR director LIKE ?", *(["%#{phrase}%"] * 2))
  end

  scope :range_runtime, -> (min, max) do
    where("runtime_in_minutes BETWEEN ? AND ?", min, max) 
  end

  def review_average
    reviews.size != 0 ? reviews.sum(:rating_out_of_ten)/reviews.size : 0
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
