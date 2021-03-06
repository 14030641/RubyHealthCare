class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,:confirmable
  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_one_attached :avatar
  has_many :answers
  has_many :prescription
  belongs_to :speciality
end
