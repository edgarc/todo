require 'spec_helper'

describe TodosController do
  before(:each) do
    Todo.delete_all
  end
  
  it "should render todos" do
    get 'index'
    response.should be_success
  end
  
  it "should create with valid params" do
    post 'create', :todo => { :description => 'test' }
    flash[:notice].should_not be_nil
    assigns[:todo].should_not be_new_record
  end
  
  it "should not create with invalid params" do
    post 'create', :todo => { :description => '' }
    assigns[:todo].should be_new_record
  end
  
  it "should update a todo as complete" do
    post 'create', :todo => { :description => 'test' }
    post 'update', :todo => { :id => '1', :complete => true }
    Todo.first.complete.should be(true)
  end
end
