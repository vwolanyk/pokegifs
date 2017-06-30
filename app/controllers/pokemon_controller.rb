class PokemonController < ApplicationController

def show

pokemon = Typhoeus::Request.new("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)


    pokemon.on_complete do |response|

      if response.success?
        pokemon_body = JSON.parse(response.body)

        gif = Typhoeus.get("http://api.giphy.com/v1/gifs/search?q=#{pokemon_body["name"]}&api_key=#{ENV['GIPHY_KEY']}&limit=1", followlocation: true)
        gif_body = JSON.parse(gif.body)

           render json: {
             name: pokemon_body["name"],
             id: pokemon_body["id"],
             types: pokemon_body["types"][0]["type"]["name"],
             weight: pokemon_body["weight"],
             gif:  gif_body["data"][0]["url"]
          }

      elsif response.timed_out?
        # aw hell no
         log("got a time out")
      elsif response.code == 0
        # Could not get an http response, something's wrong.
        log(response.return_message)
      else
        # Received a non-successful http response.

        render json: { ERROR: "HTTP request failed: " + response.code.to_s}
      end
    end

    pokemon.run



end

end
