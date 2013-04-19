require 'twitter'

class Lazer
  
  def initialize(account,tweets)
    @tweets = []
    tweets.each_line("\n") do |row|
      @tweets.push row.chomp
    end
    @tweet = ""
    @client = Twitter::Client.new(
      :consumer_key => account[0]['consumer_key'],
      :consumer_secret => account[0]["consumer_secret"],
      :oauth_token => account[0]["oauth_token"],
      :oauth_token_secret => account[0]["oauth_token_secret"]
      )
  end

  def firin_mah_lazer(message)
    @client.update(message)
  end

  def chargin_mah_lazer
    
    loop do
      @tweet = @tweets.sample
      while @tweet.length > 140
        @tweet = @tweets.sample
      end  
      begin
        firin_mah_lazer @tweet
        #puts "Tweeting: #{tweet}"
        sleep(Random.rand(220...360))
      rescue Exception => e
        #puts "Tweet failed"
        puts e.message
        #puts e.backtrace.inspect
        sleep(Random.rand(10..20))
      end
    end

  end

end