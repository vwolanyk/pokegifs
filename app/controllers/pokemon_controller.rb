class PokemonController < ApplicationController

def show

pokemon = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)
body = JSON.parse(pokemon.body)
body["name"]
   render json: {
    "message" => "ok"
  }
end


end
