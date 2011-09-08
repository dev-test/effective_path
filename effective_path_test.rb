require 'rubygems'
require 'rspec'

require 'effective_path'

describe EffectivePath do

  before(:each) do
    @effective_path = EffectivePath.new
  end

  context "when the string is empty" do
    it "should return the empty string" do
      @effective_path.path_for("").should == ""
    end
  end 

end
