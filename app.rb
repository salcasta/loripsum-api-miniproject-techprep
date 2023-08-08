require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do

erb(:main_page)
end


get("/results") do

  paragraph = params.fetch("paragraph")
  paragraph_append = "/#{paragraph}"

  length = params.fetch("length").downcase
  length_append = "/#{length}"

  if params.fetch("decorate").downcase == "yes"
    decorate = "decorate"
    decorate_append = "/#{decorate}"
  end

  if params.fetch("link").downcase == "yes"
    link = "link"
    link_append = "/#{link}"
  end

  if params.fetch("ul").downcase == "yes"
    unordered_list = "ul"
    unordered_list_append = "/#{unordered_list}"
  end

  if params.fetch("ol").downcase == "yes"
    ordered_list = "ol"
    ordered_list_append = "/#{ordered_list}"
  end

  if params.fetch("dl").downcase == "yes"
    description_list = "dl"
    description_list_append = "/#{description_list}"
  end

  if params.fetch("bq").downcase == "yes"
    blockquotes = "bq"
    blockquotes_append = "/#{blockquotes}"
  end
 
  if params.fetch("headers").downcase == "yes"
    headers = "headers"
    headers_append = "/#{headers}"
  end 

  if params.fetch("allcaps").downcase == "yes"
    allcaps = "allcaps"
    allcaps_append = "/#{allcaps}"
  end
 

  @url = "https://www.loripsum.net/api#{paragraph_append}#{length_append}#{decorate_append}#{link_append}#{unordered_list_append}#{ordered_list_append}#{description_list_append}#{blockquotes_append}#{headers_append}#{allcaps_append}" 

  @output = HTTP.get(@url)
 
erb(:result_page)
end


get("/bacon") do
  
  erb(:bacon_ipsum_page)
end

get("/bacon_result") do

  paragraph = params.fetch("paragraph")
  paragraph_append = "&paras=#{paragraph}"

  sentence = params.fetch("sentence")
  sentence_append = "&sentences=#{sentence}"

  @url = "https://baconipsum.com/api/?type=all-meat&#{paragraph_append}#{sentence_append}&start-with-lorem=1&format=text"

  @output = HTTP.get(@url)
  
  erb(:bacon_ipsum_result)
end

get("/hipster") do
  
  erb(:hipster_ipsum_page)
end

get("/hipster_result") do

  paragraph = params.fetch("paragraph")
  paragraph_append = "&paras=#{paragraph}"

  sentence = params.fetch("sentence")
  sentence_append = "&sentences=#{sentence}"

  if params.fetch("paragraph").length > 0
    paragraph = params.fetch("paragraph")
    paragraph_append = "&paras=#{paragraph}"

    @url = "http://hipsum.co/api/?type=hipster-centric#{paragraph_append}&format=text"
  elsif params.fetch("sentence").length > 0
    sentence = params.fetch("sentence")
    sentence_append = "&sentences=#{sentence}&format=text"

    @url = "http://hipsum.co/api/?type=hipster-centric#{sentence_append}&format=text"
  else 
   @url = "https://hipsum.co/api/?type=hipster-centric&format=text"
  end


  erb(:hipster_ipsum_result)
end
