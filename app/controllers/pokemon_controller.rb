class PokemonController < ApplicationController

def show


pokemon = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)
pokemon_body = JSON.parse(pokemon.body)

if pokemon.code == 404
  render :error
else
gif = Typhoeus.get("http://api.giphy.com/v1/gifs/search?q=#{pokemon_body["name"]}&api_key=#{ENV['GIPHY_KEY']}&limit=1", followlocation: true)
gif_body = JSON.parse(gif.body)




   render json: {
     name: pokemon_body["name"],
     id: pokemon_body["id"],
     types: pokemon_body["types"][0]["type"]["name"],
     weight: pokemon_body["weight"],
     gif:  gif_body["data"][0]["url"]
  }
end

end
end
