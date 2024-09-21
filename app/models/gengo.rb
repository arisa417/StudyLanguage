class Gengo < ApplicationRecord

  has_and_belongs_to_many :users
  #has_many :user_gengo
  #has_many :users, through: :user_gengo

end
