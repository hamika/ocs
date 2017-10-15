class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :trackable, :validatable
  has_many :action_plans, dependent: :nullify
  enum authority: { admin: 0, leader: 1, member: 2 }
end
