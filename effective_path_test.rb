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
    
    it "should handle the removal of several parent directories" do
      @effective_path.path_for("c:/dir1/../dir2/../dir3/").should == "c:/dir3/"
    end
    
    it "should handle the removal of several consecutive parent directories" do
      @effective_path.path_for("c:/dir1/dir2/../../dir3/").should == "c:/dir3/"
    end 

    it "should not navigate higher than the root directory" do
      @effective_path.path_for("c:/../../dir3/").should == "c:/dir3/"
    end
  end  
  
  context "when the string contains both the parent(..) and current(.) directory operators" do
    it "should render the correct result" do
      @effective_path.path_for("c:/dir1/dir2/./dir3/../dir4/file.txt").should == "c:/dir1/dir2/dir4/file.txt"
    end
  end
end
