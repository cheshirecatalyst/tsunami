Tsunami::App.controllers :storms do

  get :index do
    @storms = Storm.all(:order => 'created_at desc')
    render 'storms/index'
  end

  post :index do
    @storm = Storm.new
    @storm.name = params[:name]
    @storm.tweets = params[:tweets]
    @storm.save
    
    @storms = Storm.all(:order => 'created_at desc')
    render 'storms/index'
  end  

end
