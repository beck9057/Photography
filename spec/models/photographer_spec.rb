require 'spec_helper'

describe Photographer do
  
  before(:each) do
    @attr = { :name => "John Doe", :email => "john@example.com" }
  end
  
  it "should create a new instance given a valid attribute" do
    Photographer.create!(@attr)
  end
  
  it "should require a user name" do
    no_name_user = Photographer.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = Photographer.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 257
    long_name_user = Photographer.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp first.last+something@foo.jp]
    addresses.each do |address|
      valid_email_user = Photographer.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org first.last@foo.jp, example.user@foo.]
    addresses.each do |address|
      invalid_email_user = Photographer.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    Photographer.create!(@attr)
    photographer_with_duplicate_email = Photographer.new(@attr)
    photographer_with_duplicate_email.should_not be_valid
  end
  
  it "should reject duplicate email addresses identical up to case" do
    Photographer.create!(@attr)
    photographer_with_duplicate_email = Photographer.new(@attr.merge(:email => @attr[:email].upcase))
    photographer_with_duplicate_email.should_not be_valid
  end
  
end