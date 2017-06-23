class Lender < ActiveRecord::Base
  has_secure_password

  has_many :histories
  has_many :borrowers, through: :histories, source: :lender
  

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :password, presence: true, on: :create
  validates :first_name, :last_name, :email, :money, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

end
