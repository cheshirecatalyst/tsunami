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

  post :index, :with => :id do
    @key = Twitkey.where(:id => params[:id]).first
    @key.update_attributes( :name => params[:name], :consumer_key => params[:consumer_key], :consumer_secret => params[:consumer_secret], :oauth_token => params[:oauth_token], :oauth_token_secret => params[:oauth_token_secret])
    @key.save
    @twitkeys = Twitkey.all(:order => 'created_at desc')
    render 'twitkeys/index'
  end

  get :edit, :with => :id do
    @key = Twitkey.where(:id => params[:id]).first
    render 'twitkeys/edit'
  end

  get :destroy, :with => :id do
    key = Twitkey.find(params[:id])
    if key
      key.destroy
      redirect url(:twitkeys, :index)
    else
      halt 404
    end
  end


end