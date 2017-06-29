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

require 'test_helper'

class LogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
