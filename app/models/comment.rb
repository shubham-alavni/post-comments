class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_one :reply, class_name: "Comment", foreign_key: 'reply_id'
end
