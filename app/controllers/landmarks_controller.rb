class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  post '/landmarks' do
    Landmark.create(:name => params["landmark"]["name"], :year_completed => params["landmark"]["year_completed"])
    redirect to "/landmarks"
  end

end
