class Question < ApplicationRecord
    belongs_to :user
    has_many :answers
    has_many :qcomments
    validates_presence_of :title, :body
    acts_as_votable
    acts_as_taggable_on :tags

    searchable do
        text :title, :body, :question_user
        text :answers do
            answers.map(&:body)
        end
    end

    def question_user
        user.email
    end

    def addPoints
        user.points += 10
        user.save
    end

    def subtractPoints
        user.points -= 10
        user.save
    end

end
