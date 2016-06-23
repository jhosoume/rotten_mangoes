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

  def review_average
    reviews.size != 0 ? reviews.sum(:rating_out_of_ten)/reviews.size : 0
  end

  def self.select_by_attr(attr, value, movies = nil)
    movies ||= self
    movies.where("#{attr} LIKE ?", "%#{value}%")
  end

  def self.select_by_duration(min = 0, max = 5000, movies = nil)
    movies ||= self
    movies.where(runtime_in_minutes: (min..max))
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
