require 'rails_helper'

feature 'Show questions', %q{
  User able to view all questions
} do

  given(:questions) { create_list(:question, 5) }

  scenario 'User view questions' do
    questions
    visit questions_path
    questions.each { |question| expect(page).to have_content question.title }
  end
end

