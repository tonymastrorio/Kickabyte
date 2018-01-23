class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    has_many :qcomments
    validates_presence_of :title, :body
    acts_as_votable
    
end
