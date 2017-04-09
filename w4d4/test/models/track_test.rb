# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  songname   :string           not null
#  album_id   :integer          not null
#  type       :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
