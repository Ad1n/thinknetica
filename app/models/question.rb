# class Question < ApplicationRecord
# end

class Question < ActiveRecord::Base
  validates :title, :body,  :presence => true
  has_many :answers, dependent: :destroy
  belongs_to :user
end
