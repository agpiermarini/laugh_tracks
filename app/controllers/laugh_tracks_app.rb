class LaughTracksApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)

  get '/' do
    erb :index
  end

  get '/comedians' do
    erb :'comedians/index',
        :locals => {
        :all_comedians => Comedian.all,
        :specials => Special.all
        }
  end
end
