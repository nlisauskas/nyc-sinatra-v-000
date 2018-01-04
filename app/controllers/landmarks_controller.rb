class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  post '/landmarks' do
    Landmark.create(params)
    redirect to "/landmarks"
  end

end
