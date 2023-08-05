require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  @url = "https://loripsum.net/api"
  @output = HTTP.get(@url)
erb(:main_page)
end


get("/results") do

  paragraph = params.fetch("paragraph")
  paragraph_append = "/#{paragraph}"

  length = params.fetch("length")
  length_append = "/#{length}"


  

  @url = "https://www.loripsum.net/api#{paragraph_append}#{length_append}" 
  @output = HTTP.get(@url)
 
erb(:result_page)
end
