require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  @url = "https://loripsum.net/api"
  @output = HTTP.get(@url)
erb(:main_page)
end
