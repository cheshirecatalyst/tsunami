# Helper methods defined here can be accessed in any controller or view in the application

Tsunami::App.helpers do
  # def simple_helper_method
  #  ...
  # end
  def search_client
    acc = Twitkey.first
    p acc
    return beam = Lazer.new(acc)
  end


end
