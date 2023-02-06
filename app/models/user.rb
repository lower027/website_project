class User < ApplicationRecord

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  validates :first_name, :last_name, :email, :username, presence: true

  validates :email, format: { with: /\S+@\S+/ },
    uniqueness: {case_sensitive: false}

  validates :username, uniqueness: {case_sensitive: false}




  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
