require 'spec_helper'

describe Todo do
  
  before(:each) do
    @attr = {
      :description => "Todo Test"
    }
  end
  
  it "should create a valid todo" do
    Todo.create!(@attr)
  end
  
  it "should require a name" do
    invalid_todo = Todo.new(@attr.merge(:description => ""))
    invalid_todo.should_not be_valid
  end
  
  it "should be marked as complete" do
    complete_todo = Todo.new(@attr.merge(:complete => true))
    complete_todo.complete.should be_true
  end
  
  it "should update position" do
    todo = Todo.create!(@attr.merge(:position => 2))
    todo.position.should == 2
  end
end
