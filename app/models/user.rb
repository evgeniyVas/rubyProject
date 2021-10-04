class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def username
    self.email.split('@')[0].capitalize
  end

  enum subscription: {
    weekly: 0,
    daily: 1,
    refusal: 2
  }
end
