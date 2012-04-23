class User < ActiveRecord::Base

  belongs_to :site
  belongs_to :division
  
  # has_one :emergency_contact
  
  has_many :allergies
  has_many :allergens, :through => :allergies
  has_many :prescriptions
  
  # has_many :diagnoses
  # has_many :conditions, :through => :diagnoses
  
  # has_many :procedures
  # has_many :procedures, :through => :procedures
  
  # has_many :provider_assignments
  # has_many :providers, :through => :provider_assignments
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :language, :name_first, :name_last, :name_middle, :name_suffix, :site_id, :division_id
  
  validates :name_first,   
            :presence => true,   
            :length => { :within => 1..30 }
            
  validates :name_middle,
            :length => { :maximum => 1 }
  
  validates :name_last,   
            :presence => true,   
            :length => { :within => 1..30 }
            
  validates :email,   
            :presence => true,   
            :uniqueness => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
            
  validates :password,   
            :presence => true,   
            :length => { :within => 8..36 },
            :exclusion => { :in => %w( password 1qaz2wsx 12345678 123456789 ) }
            
  def name
    name_last + ", " + name_first
  end
  
  def provider?
    false
  end
  
  def participant?
    false
  end
  
  
end
