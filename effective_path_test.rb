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
    ["c:/dir1/dir2/", "c:/dir1/dir2/file.txt", "file.txt"].each {|dir|
      it "should return the string unchanged for '#{dir}'" do
        @effective_path.path_for(dir).should == dir
      end
    } 
  end

  context "when the string contains the current(.) directory operator" do
    it "should remove that link from the effective path" do
      @effective_path.path_for("c:/dir1/./dir2/").should == "c:/dir1/dir2/"
    end 
  end
 
  context "when the string contains the parent(..) directory operatator" do
    it "should remove the previous directory from the path" do
      @effective_path.path_for("c:/dir1/../dir2/").should == "c:/dir2/"
    end
  end  
  
end
