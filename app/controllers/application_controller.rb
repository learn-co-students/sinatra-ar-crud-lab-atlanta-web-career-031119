
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do


    erb :new
  end

        post '/articles' do
        #  x = params([:title])
        #  y = params(:content)
          #article = {:title => x, :content => y}

           #article = params([:article][:content])
          new = Article.new(params)
                    #binding.pry

           new.save
                   #binding.pry

                  # @articles = Article.all
                     id = new.id
                  redirect "/articles/#{Article.last.id}"
                   #redirect to ("/articles?#{@articles.id}")
          end
             get '/articles' do

              @articles = Article.all

                erb :index
             ## grab all articles and store them in instance variable

          end


             patch '/articles/:id' do
               id = params[:id]
              @article = Article.find_by(id: id)
              @article.title = params[:title]
              @article.content = params[:content]
               @article.save
               redirect to "/articles/#{@article.id}"

              #binding.pry

             end

              get '/articles/:id/edit' do
                id = params[:id]
               new = Article.find_by(id: id)

               @article = new

               erb :edit
              end

              get '/articles/:id/delete' do

                id = params[:id]
                new = Article.find_by(id: id)
                @article = new
                 erb :form
               end


                # delete '/articles/:id/delete' do #delete action
                #  @article = Article.find_by_id(params[:id])
                #   @article.delete
                #       redirect to '/articles'
                #      end

                  delete '/articles/:id' do
                # #   #    binding.pry
                   id = params[:id]
                # #
                   Article.destroy(params[:id])
                # # # binding.pry
                    redirect to "/articles"
                  end
                #



             get '/articles/:id' do
              id = params[:id]
                 article = Article.find_by(id: id)

                  @article = article

                  erb :show
                #binding.pry
             end









end
