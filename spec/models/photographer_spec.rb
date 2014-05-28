# == Schema Information
#
# Table name: photographers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

require 'spec_helper'

describe Photographer do
  
  before do
    @photographer = Photographer.new(
        name: "John Doe",
        email: "john@example.com",
        password: "foobar",
        password_confirmation: "foobar")
  end
  
  subject { @photographer }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }

  describe "when there is no name" do
    before { @photographer.name = " " }
    it { should_not be_valid }
  end
  
  describe "when there is no email address" do
    before { @photographer.email = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @photographer.name = "a" * 257 }
    it { should_not be_valid }
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp first.last+something@foo.jp]
      addresses.each do |address|
      @photographer.email = address
      expect(@photographer).to be_valid
      end
    end
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org first.last@foo.jp, example.user@foo.]
      addresses.each do |address|
      @photographer.email = address
      expect(@photographer).not_to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do
      photographer_with_same_email = @photographer.dup
      photographer_with_same_email.save
    end
    it { should_not be_valid }
  end
  
  describe "when there are duplicate email addresses including case" do
    before do
      photographer_with_same_email = @photographer.dup
      photographer_with_same_email.email = @photographer.email.upcase
      photographer_with_same_email.save
    end
    it { should_not be_valid }
  end
  

  describe "when password is not present" do
    before { @photographer.password = " ", @photographer.password_confirmation = " "}
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @photographer.password_confirmation = "mismatch"}
    it { should_not be_valid }
  end
  
  
  describe "return value of authenticate method" do
    before { @photographer.save }
    let(:found_photographer) { Photographer.find_by(email: @photographer.email) }

    describe "with valid password" do
      it { should eq found_photographer.authenticate(@photographer.password) }
    end

    describe "with invalid password" do
      let(:photographer_for_invalid_password) { found_photographer.authenticate("invalid") }

      it { should_not eq photographer_for_invalid_password }
      specify { expect(photographer_for_invalid_password).to be_false }
    end
  end
  
end

