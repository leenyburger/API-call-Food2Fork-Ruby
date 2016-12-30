require 'httparty'	#Note : This file is in the models >> filename.rb
#Don't need to require when using bundler
#Restful Web Services 
#1. Base URI 2. Support XML or JSON 3. Support HTTP operations (GET, POST)
#Think of web at MVC : website you can get resources in any format 
#HTTParty parses XML or JSON for you (like your browser - it's a client).  Parses into a Ruby hash or array

class Recipe
    include HTTParty
    ENV["FOOD2FORK_KEY"] = "5b6b74c6cc0fa9dc23871a7ae753f6c7"

    base_uri "https://food2fork.com/api" #Same across most requests 
    default_params key: ENV["FOOD2FORK_KEY"] #defaults, like API developer key #fields: "image_url, source_url, title",
    format :json #Tell it which format data comes in
    #q:"search" request parameter 

    def self.for (keyword) 
    	#class method called for which takes in a term 
    	get("/search", query: {q: keyword})["recipes"]  #get is method provided by HTTParty 

        #elements is the key of the hash from coursera documentation
        #returns array where each element in the array is a hash 
	end 
    pp Recipe.for "chocolate"
end






