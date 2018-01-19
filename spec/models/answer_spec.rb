require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "Validates presence of text" do
    expect(Answer.new(body: '')).to_not be_valid
  end
end
