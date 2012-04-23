class Provider < User

  def provider?
    true
  end
  
  self.AVAILABLE_ROLES = %w[super study_admin site_coordinator division_coordinator provider]

  def super?
    role == :super?
  end
  
  def study_admin?
    role == :study_admin || super?
  end
  
  def site_coordinator?
    role == :site_coordinator || study_admin?
  end
  
  def division_coordinator?
    role == :division_coordinator || site_coordinator?
  end 

end