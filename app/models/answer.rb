class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :question
    has_many :acomments, dependent: :destroy
    validates_presence_of :body, :url
    acts_as_votable

    def addPoints
        user.points += 10
        user.save
    end

    def subtractPoints
        user.points -= 10
        user.save
    end

end
