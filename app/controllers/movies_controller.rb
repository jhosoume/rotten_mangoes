class MoviesController < ApplicationController
  before_action :restrict_access, except: [:show, :index]

  include MoviesHelper

  def index
    if params[:title_or_director]
      @movies = Movie.by_title_or_director(params[:title_or_director].strip).range_runtime(*range_duration(params[:runtime_in_minutes]))
    end
    @movies ||= Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new()
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image, :description
    )
  end

end
