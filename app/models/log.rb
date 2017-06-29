# == Schema Information
#
# Table name: logs
#
#  id          :integer          not null, primary key
#  exercise_id :integer          not null
#  workout_id  :integer          not null
#  weight      :integer
#  reps        :integer
#  time        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  completed?  :boolean          default(FALSE)
#

class Log < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
end
