class MoviesController < ApplicationController
    before_action :find_movie, only:[:show, :update, :destroy]
    before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
    before_action :isAdmin , only: [:new, :create, :edit, :update, :destroy]
    def index
        @movies = Movie.all
    end

    def show
    end

    def new

        @movie = Movie.new
    end

    def create
        #Movie.create(title: movie_params[:title], genre: movie_params[:genre], year: movie_params[:year], length: movie_params[:length])
        movie = Movie.create(movie_params)
        begin
        redirect_to movies_path, notice: "#{movie.title} created successfully"
        rescue StandardError => e
            puts e.message
            redirect_to movies_path, notice: "#{movie.title} creation unsuccessful"
        end
    end

    def destroy
        title = @movie.title
        @movie.destroy
        #Movie.destroy(params[:id])
        redirect_to movies_path, notice: "#{title} deleted successfully"
    end

    def find_movie
        begin
            @movie = Movie.find(params[:id])
        rescue StandardError => e
            puts e.message
            #flash[:error] = e.message
            redirect_to movies_path, alert: "This movie id #{params[:id]} does not exist in the database"
        end
    end

    def movie_params
        params.require(:movie).permit(:title, :genre, :year, :length, :price, :picture)
    end

    def isAdmin
        if !current_user.admin
            redirect_to movies_path, alert: "You do not have required permissions to access this page"
        end
    end
end
