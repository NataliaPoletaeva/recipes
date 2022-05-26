class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  has_many :foods
  has_many :inventories
  validates_associated :recipes
  validates :name, presence: true

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
