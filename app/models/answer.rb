# class Answer < ApplicationRecord
# end

class Answer < ActiveRecord::Base
  validates  :body,  :presence => true
  belongs_to :question
end