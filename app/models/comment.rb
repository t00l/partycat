class Comment < ActiveRecord::Base
  belongs_to :liquorstore
  belongs_to :user
end
