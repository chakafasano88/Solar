require "sinatra"

# Home Page
get '/' do

  erb :home
end

# About Page
get "/about" do
  "Profile stuff"
    erb :about
end

# Photos page
get "/photos" do
  "Contact info"
    erb :photos
end
# Contact Page
get "/contact" do
  "Contact info"
    erb :contact
end
