# PokeGIFs

Today we're going to build a simple API.

This API will allow its consumers to lookup a [Pokemon](https://en.wikipedia.org/wiki/Pok%C3%A9mon) based on its name or ID number, get some basic info about that Pokemon, and also get a random GIF associated with it.

Pokemon is a huge franchise, and there are currently about 800 different Pokemon. Rather than trying to maintain a list of all these different Pokemon, and also trying to find and store a bunch of GIFs for each one, our API is just going to get all its data from two other APIs, and smash the results together.

Those two APIs are:
+ [The Pokemon API](http://pokeapi.co/)
+ [The GIPHY API](https://developers.giphy.com/)

Let's get started!

## Using the Pokemon API
[The Pokemon API](http://pokeapi.co/) is pretty easy to get started with, so we'll start there. Spend a few minutes looking at the documentation.

We're really only going to use one of the endpoints for this assignment: `/pokemon/:id`

The API doesn't require authentication to use, so we can open up [Postman](https://www.getpostman.com/) and try running a couple queries.

Try looking up a Pokemon based on an `id` number, like `93` for example. You can also lookup a Pokemon by `name` instead of `id` by just putting a name instead of a number into the `:id` part of the URL (ie. `/pokemon/pikachu`).

We'll be making use of the `name`, the `id`, and the `types` from the response.

## Using the GIPHY API
[The GIPHY API](https://developers.giphy.com/) is a little more complicated, because we need a **client key** to use it. You'll need to first [signup for an account](https://giphy.com/join), and then [register an app from the developer dashboard](https://developers.giphy.com/dashboard/). There's no need to request a production key; a beta key is sufficient for the assignment.

Take a minute to look over [the API documentation](https://developers.giphy.com/docs/). Again, there's only one endpoint we need for this assignment: `/v1/gifs/search`

## Putting Everything Together
