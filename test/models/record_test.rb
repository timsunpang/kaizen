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

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
