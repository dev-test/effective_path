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

  context "when the string does not contain operators for the current(.) or parent(..) directories" do
    it "should return the string unchanged" do
      @effective_path.path_for("c:/dir1/dir2/").should == "c:/dir1/dir2/"
    end 
  end
  
end
