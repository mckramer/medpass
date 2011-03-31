class User < ActiveRecord::Base

  # has_one :emergency_contact
  
  has_many :allergies
  has_many :allergens, :through => :allergies
  
  # has_many :diagnoses
  # has_many :conditions, :through => :diagnoses
  
  # has_many :procedures
  # has_many :procedures, :through => :procedures
  
  # has_many :provider_assignments
  # has_many :providers, :through => :provider_assignments
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :language
end
