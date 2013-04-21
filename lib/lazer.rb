require 'twitter'

class Lazer
  
  def initialize(account,tweets = "")
    @tweets = []
    tweets.each_line("\n") do |row|
      @tweets.push row.chomp
    end
    puts "In lazer"
    p account
    @tweet = ""
    begin
      @client = Twitter::Client.new(
        :consumer_key => account[0]['consumer_key'],
        :consumer_secret => account[0]["consumer_secret"],
        :oauth_token => account[0]["oauth_token"],
        :oauth_token_secret => account[0]["oauth_token_secret"]
        )
    rescue
      @client = Twitter::Client.new(
        :consumer_key => account['consumer_key'],
        :consumer_secret => account["consumer_secret"],
        :oauth_token => account["oauth_token"],
        :oauth_token_secret => account["oauth_token_secret"]
        )
    end
  end

  def find_ammo(query,count = 20, lang = "en", type = 'recent')
    query << " -rt"
    count = count.to_i
    intermediate = @client.search(query, :count => count, :lang => lang, :result_type => type).results
    results = []
    cleaner = HTMLEntities.new
    intermediate.each do |tweet|
      text = tweet.text
      text = text.gsub("\n", ' ').squeeze(' ')
      text = cleaner.decode text
      text = text.chomp
      results.push text
    end
    results = results.inject([]) { |result,h| result << h unless result.map{|i| i.downcase}.include?(h.downcase); result }
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