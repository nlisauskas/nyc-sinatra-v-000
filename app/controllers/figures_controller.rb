require 'pry'
class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params["figure"]["name"])
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.landmark_ids = params["figure"]["landmark_ids"]
## new landmarks
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.find_or_create_by(:name => params["landmark"]["name"])
    end
## new titles
    if !params["title"]["name"].empty?
      @figure.titles << Title.find_or_create_by(:name => params["title"]["name"])
    end

    @figure.save
  end

  get '/figures' do

    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(:id => params[:id])

    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(:id => params[:id])

    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(:id => params[:id])

    @figure.name = params["figure"]["name"]
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.landmark_ids = params["figure"]["landmark_ids"]
## new landmarks
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.find_or_create_by(:name => params["landmark"]["name"])
    end
## new titles
    if !params["title"]["name"].empty?
      @figure.titles << Title.find_or_create_by(:name => params["title"]["name"])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
