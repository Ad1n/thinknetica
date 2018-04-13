require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create :question }
  let(:answer) { create :answer, question: question }

  describe 'GET #new' do
    before { get :new, params: {question_id: question} }

    it 'assigns new answer to question' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do

    context 'with valid attributes' do
    it 'saves answer to db' do
      expect { post :create, params: { answer: attributes_for(:answer), question_id: question } }.to change(question.answers, :count).by(1)
    end
    end

    context 'with invalid attributes' do
    it 'doesnt saves the answer' do
      expect { post :create, params: { answer: { body: nil }, question_id: question } }.to_not change(Answer, :count)

    end
    end
  end

  describe 'PATCH #update' do

    context 'with valid attributes' do
      it 'assigns the requested answer to @answer' do
        patch :update, params: { id: answer, answer: attributes_for(:answer), question_id: question }
        expect(assigns(:answer)).to eq answer
      end

      it 'change answer attributes' do
        patch :update, params: { id: answer, answer:{ body: 'New answer body' }, question_id: question }
        answer.reload
        expect(answer.body).to eq 'New answer body'
      end
    end
  end
end
