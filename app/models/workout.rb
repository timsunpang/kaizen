# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  completed? :boolean          default(FALSE), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workout < ActiveRecord::Base
  has_many :logs
  belongs_to :user
end
