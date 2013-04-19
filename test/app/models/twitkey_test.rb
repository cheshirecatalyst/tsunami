require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class TwitkeyTest < Test::Unit::TestCase
  context "Twitkey Model" do
    should 'construct new instance' do
      @twitkey = Twitkey.new
      assert_not_nil @twitkey
    end
  end
end
