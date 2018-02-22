class Qcomment < ApplicationRecord
    belongs_to :question
    belongs_to :user
    belongs_to :parent, class_name: "Qcomment", optional: true
    has_many :replies, class_name: "Qcomment", foreign_key: :parent_id, dependent: :destroy
end
