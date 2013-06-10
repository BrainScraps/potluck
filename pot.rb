require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'require_all'

require_relative "db.rb"
require_all "models"


get "/" do

  redirect "/potlucks"
end

#POTLUCKS!!!



#list potlucks VIEW
get "/potlucks" do

  @potlucks = Potluck.all
  erb :view_potlucks
end

#create potluck VIEW & ACTION
get "/potluck/new" do
  erb :create_potluck
end

post "/potluck/new" do
  @potluck = Potluck.create(params[:potluck])
  @redir = "/potluck/#{@potluck.id}"
  redirect @redir
end
#destroy potluck ACTION
post "/potluck/destroy" do

  Potluck.destroy(params[:id])
  redirect "/potlucks"

end

#view one potluck VIEW
get "/potluck/:id" do

  @potluck = Potluck.find(params[:id])
  erb :show_potluck

end

#ITEMS!!!!!

#ADD ITEM to POTLUCK VIEW & ACTION
get "/potluck/:p/add_item" do

  @potluck = Potluck.find(params[:p])
  @tags = Tag.all

  erb :add_item
end

post "/potluck/:p/add_item" do

  @item = Item.create(params[:item])

  @redir = "/potluck/#{params[:p]}"

  redirect @redir
end

#remove item from potluck ACTION
post "/potluck/remove_item" do

  Item.destroy(params[:id])

  @redir = "/potluck/#{params[:potluck]}"

  redirect @redir
end

#claim potluck/item by user VIEW & ACTION
get "/potluck/:p/item/:i" do

  @potluck = Potluck.find(params[:p])
  @item = Item.find(params[:i])

  erb :claim_item

end

post "/potluck/:p/claim_item" do

  @person = Person.find_or_create_by_name(params[:person])

  @item = Item.find(params[:item])

  @item.update_attributes(:person_id => @person.id)

  @redir = "/potluck/#{params[:p]}"

  redirect @redir

end


#TAGS!!!!!!!!!!!!!!!!!!!

# all tags view
get "/tags" do

  @tags = Tag.all

  erb :tags

end

#create tags  ACTION
post "/tags" do

  @tag = Tag.create(:name => params[:tag])

  redirect "/tags"

end

#List people view

get "/people" do
  @people = Person.all

  erb :people
end

#Person view

get '/person/:p' do
  @person = Person.find(params[:p])
  erb :view_person
end



