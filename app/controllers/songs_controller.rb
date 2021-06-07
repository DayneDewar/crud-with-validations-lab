class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end
    
    def new
        @song = Song.new()
    end

    def create
        @song = Song.create(song_params)

        if @song.valid?
            redirect_to song_path(@song)
        else    
            redirect_to new_song_path
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
               
        if @song.valid?
            redirect_to song_path(@song)
        else
            redirect_to edit_song_path(@song)
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
    
end
