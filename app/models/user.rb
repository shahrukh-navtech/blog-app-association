class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 8..128

  # validates :password, :format => {:with => /((?=.*\d).{1,})/, 
  # 											message: "must include 1 digit."}
  # validates	:password, :format => {:with => /((?=.*[a-z]).{1,})/, 
  # 											message: "must include 1 Lower Case letter."}
  # validates :password, :format => {:with => /((?=.*[A-Z]).{1,})/, 
  # 											message: "must include 1 Upper Case letter."}
  # validates :password, :format => {:with => /(?=.*[!@#$%^&*()_+=~`]).{1,}/, 
  # 											message: "must include 1 Symbol."}

  
  # def password_complexity
  #   return if password.blank? || password =~ /((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,})/

  #   errors.add :password, 'Complexity requirement not met. Password Should include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  # end


end
