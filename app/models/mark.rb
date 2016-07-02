class Mark < ActiveRecord::Base
  enum status: [:reading, :read]

  belongs_to :user
  belongs_to :book

  scope :favorite, -> (user){
    where(user_id: user.id, favorite: true)
  }
end
