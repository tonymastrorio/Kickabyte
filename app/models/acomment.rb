class Acomment < ApplicationRecord
    belongs_to :answer
    belongs_to :user
    belongs_to :parent, class_name: "Acomment", optional: true
    has_many :replies, class_name: "Acomment", foreign_key: :parent_id, dependent: :destroy
end
