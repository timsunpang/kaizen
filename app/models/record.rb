# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  exercise_id :integer          not null
#  max_weight  :integer
#  max_reps    :integer
#  max_time    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise
end
