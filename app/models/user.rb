class User < ActiveRecord::Base

  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #associations
  has_many :liquorstores
  has_many :comments, dependent: :destroy

end
