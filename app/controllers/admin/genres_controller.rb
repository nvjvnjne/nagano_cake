class Admin::GenresController < ApplicationController
  
  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path(genre.id)
  end
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def edit
  end
  
  def update
  end
end
