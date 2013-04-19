Tsunami::App.controllers :twitkeys do
  
  get :index do
    @twitkeys = Twitkey.all(:order => 'created_at desc')
    render 'twitkeys/index' 
  end

  post :index do
    @key = Twitkey.new
    @key.name = params[:name]
    @key.consumer_key = params[:consumer_key]
    @key.consumer_secret = params[:consumer_secret]
    @key.oauth_token = params[:oauth_token]
    @key.oauth_token_secret = params[:oauth_token_secret]
    @key.save
    
    @twitkeys = Twitkey.all(:order => 'created_at desc')
    render 'twitkeys/index'
  end

end
