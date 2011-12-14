require 'spec_helper'


describe User do
  context "create new user" do
    before(:each) do 
      @user = Factory.build(:user)
    end

    it "should fail without username" do
      @user = Factory.build(:user, {:username => nil})
      @user.email = "foo@bar.com"
      @user.password = "12345"
      @user.valid?.should be_false
    end

    it "should fail without password" do
      @user.email = "foo@bar.com"
      @user.valid?.should be_false
    end

    it "should fail with invalid email" do
      @user.password = "12345"
      @user.valid?.should be_false
    end

    it "should save with valid email and password" do
      @user.email = "foo@bar.com"
      @user.password = "12345"
      @user.valid?.should be_true
    end

  end
end
