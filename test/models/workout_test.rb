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

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
