require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should validate_presence_of :body }
  # before(:all) { @question1 = Question.new }
  #
  # it "Validates presence of text" do
    # expect(Answer.new(question: @question1, body: nil)).to_not be_valid
  # end
end
