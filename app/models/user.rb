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
  
  
  # We chose to implement speciaties via integers and an enum type
  enum specialty: [ :generalist, :dentist, :cardiologist, :dermatologist, :ophthalmologist ]
  
  # Method that transformers a given address into the valid string, for the Google Maps api
  def address_to_marker
    @result = "&markers=label:" + self.id.to_s + "|"
    @result += URI.escape(self.address) + "," + self.postal_code.to_s + "," + self.city
  end
  
  
end
