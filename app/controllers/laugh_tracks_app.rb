class LaughTracksApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)

  get '/' do
    erb :index
  end

  get '/comedians' do
    if params.nil?
      comedians = Comedian.all
    else
      comedians = Comedian.where({age: params[:age]})
    end

    erb :'comedians/index',
    :locals => {
      :all_comedians => comedians,
      :specials => Special.all
    }
  end
end
