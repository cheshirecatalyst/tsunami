# Helper methods defined here can be accessed in any controller or view in the application

Tsunami::App.helpers do
  def shoop_da_whoop(account,tweets)
    lazer = Lazer.new(account,tweets)
    lazer.chargin_mah_lazer
  end
end
