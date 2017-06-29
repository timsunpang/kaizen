# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exercise < ActiveRecord::Base
  has_many :logs
  has_many :records
end
