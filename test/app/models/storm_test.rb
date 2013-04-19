require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class StormTest < Test::Unit::TestCase
  context "Storm Model" do
    should 'construct new instance' do
      @storm = Storm.new
      assert_not_nil @storm
    end
  end
end
