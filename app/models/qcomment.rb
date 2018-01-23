class Qcomment < ApplicationRecord
    belongs_to :question
    belongs_to :user
end
