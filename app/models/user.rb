# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  last_name   :string(255)
#  first_name  :string(255)
#  address     :string(255)
#  postal_code :integer
#  city        :string(255)
#  specialty   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  
  # Attribute related stuff
  # =======================
  # We chose to implement speciaties via integers and an enum type
  enum specialty: [ :generalist, :dentist, :cardiologist, :dermatologist, :ophthalmologist ]
  
  # Associations
  # ============
  
  
  # Validations
  # ===========
  # We placed a string validator in the validators folder. It basically checks the string lenght and whether 
  # it contains any special characters
  
  validates :first_name, string: true
  validates :last_name, string: true
  validates :address, string: true
  validates :postal_code, presence: true, numericality: true
  validates :city, string: true
  validates :specialty, presence: true
  
  # Callbacks
  # =========
  
  # Other macros
  # ============
  
  # Method that transformers a given address into the valid string, for the Google Maps api
  # For some reason, the API does not work correctly when there is the \' character in the address.
  def address_to_url
    @result = URI.escape(self.address.gsub(/\'/, '') ) + "," + self.postal_code.to_s + "," + self.city + ',FR'
  end
  
end
