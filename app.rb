require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  
erb(:main_page)
end


get("/results") do

  paragraph = params.fetch("paragraph")
  paragraph_append = "/#{paragraph}"

  length = params.fetch("length")
  length_append = "/#{length}"

  if params.fetch("decorate") == "yes"
    decorate = "decorate"
    decorate_append = "/#{decorate}"
  end

  if params.fetch("link") == "yes"
    link = "link"
    link_append = "/#{link}"
  end

  if params.fetch("ul") == "yes"
    unordered_list = "ul"
    unordered_list_append = "/#{unordered_list}"
  end

  if params.fetch("ol") == "yes"
    ordered_list = "ol"
    ordered_list_append = "/#{ordered_list}"
  end

  if params.fetch("dl") == "yes"
    description_list = "dl"
    description_list_append = "/#{description_list}"
  end

  if params.fetch("bq") == "yes"
    blockquotes = "bq"
    blockquotes_append = "/#{blockquotes}"
  end
 
  if params.fetch("headers") == "yes"
    headers = "headers"
    headers_append = "/#{headers}"
  end 

  if params.fetch("allcaps") == "yes"
    allcaps = "allcaps"
    allcaps_append = "/#{allcaps}"
  end
 

  @url = "https://www.loripsum.net/api#{paragraph_append}#{length_append}#{decorate_append}#{link_append}#{unordered_list_append}#{ordered_list_append}#{description_list_append}#{blockquotes_append}#{headers_append}#{allcaps_append}" 

  @output = HTTP.get(@url)
 
erb(:result_page)
end
