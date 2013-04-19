require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class JobTest < Test::Unit::TestCase
  context "Job Model" do
    should 'construct new instance' do
      @job = Job.new
      assert_not_nil @job
    end
  end
end
