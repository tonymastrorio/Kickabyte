class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :question
    has_many :acomments
    validates_presence_of :body
    acts_as_votable

end
