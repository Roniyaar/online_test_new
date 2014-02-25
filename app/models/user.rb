class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :address, :mobile_no
  #validates :mobile_no, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates :mobile_no, numericality: { only_integer: true }, uniqueness: true
  validates :name, presence: true, uniqueness: true
  has_many :quizzes
  has_many :descriptives, :dependent => :destroy
  # attr_accessible :title, :body
end
