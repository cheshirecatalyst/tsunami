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

  post :search do
    q = params["query"]
    @q = params["query"]
    lazer = search_client
    @results = lazer.find_ammo q, 200
    @results = @results.join("\n")
    @results = @results.gsub(/\t/, '')
    @storms = Storm.all(:order => 'created_at desc')
    render 'storms/index'
  end

  get :edit, :with => :id do
    @storm = Storm.where(:id => params[:id]).first
    render 'storms/edit'
  end

  post :index, :with => :id do
    @storm = Storm.where(:id => params[:id]).first
    @storm.update_attributes(:name => params[:name], :tweets => params[:tweets])
    @storm.save
    @storms = Storm.all(:order => 'created_at desc')
    render 'storms/index'
  end

  get :destroy, :with => :id do
    storm = Storm.find(params[:id])
    if storm
      storm.destroy
      redirect url(:storms, :index)
    else
      halt 404
    end
  end



end
