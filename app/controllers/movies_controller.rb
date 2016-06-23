class MoviesController < ApplicationController

  include MoviesHelper

  def index
    [:title, :director].each do |field|
      @movies = Movie.select_by_attr(field, params[field], @movies) unless params[field].empty?
    end
    @movies = Movie.select_by_duration(*range_duration(params[:runtime_in_minutes]), @movies) unless params[:runtime_in_minutes].empty?
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
