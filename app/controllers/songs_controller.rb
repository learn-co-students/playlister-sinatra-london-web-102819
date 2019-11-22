class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :"songs/index"
    end

    get '/songs/new' do
        @genres = Genre.all.order(:name)
        @artists = Artist.all.order(:name)
        erb :"/songs/new"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params["slug"])
        erb :"songs/show"
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all.order(:name)
        @artists = Artist.all.order(:name)
        @song = Song.find_by_slug(params["slug"])
        erb :"songs/edit"
    end

    patch '/songs/:slug' do

        @song = Song.find_by_slug(params[:slug])
        
        if !params["Artist Name"].empty?
            
            if !Artist.find_by(name: params["Artist Name"])
                @artist = Artist.create(name: params["Artist Name"]) 
            else
                @artist = Artist.find_by(name: params["Artist Name"])
            end
            @song.update(artist_id: @artist.id)
            @song.save
            
        end
        
        redirect "/songs/#{@song.slug}"
    end


    post '/songs' do
        
        if !params["Artist Name"].empty?
            if !Artist.find_by(name: params["Artist Name"])
                @artist = Artist.create(name: params["Artist Name"]) 
            else
                @artist = Artist.find_by(name: params["Artist Name"])
            end
        else

        end
        @genre = Genre.find(params[:song_genre])
        @song = Song.create(name: params[:song_name], artist_id: @artist.id)
        @song.genres << @genre
        redirect "/songs/#{@song.slug}"
        
    end

    
end