class Dosage < ActiveRecord::Base
  belongs_to :drug
  
  validates_presence_of :units, :strength, :dose, :frequency, :form, :route, :drug

  # Static variables
  def self.units_list 
    [ 'mg', 'mL', 'oz' ]
  end
  def self.form_list
    [ 'tablet', 'capsule', 'liquid', 'gel', 'cream' ]
  end
  def self.route_list
    [ 'oral', 'nasal', 'Intraveneous (IV)', 'Intramusculer (IM)', 'topical' ]
  end
  def self.frequency_list
    { "every 1 hour" => 1, "2 times per day" => 12, "1 time each day" => 24 }
  end
  
  # Text helpers
  include ActionView::Helpers::TextHelper
  def frequency_text
    case frequency
    when 1..5
      return "every " + pluralize(frequency, 'hours')
    when 6, 8, 12, 24
      return pluralize(24/frequency, 'time') + ' per day'
    when 48
      return '1 time every other day'
    when 34, 42, 56, 84
      return pluralize(168/frequency, 'time') + ' per week'
    else
      return "every " + pluralize(frequency, 'hours')
    end
  end
  
  def strength_text
    "#{strength} #{units}" 
  end
  
  def dose_text
    if dose % strength == 0
      pluralize((dose/strength), form) + " (#{dose} #{units})"
    else
      "#{dose} #{units}" 
    end
  end
  
end
