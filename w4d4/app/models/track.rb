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

class Track < ApplicationRecord
  validates :songname, presence: true
  validates :album_id, presence: true
  validates :type, presence: true, inclusion: { in: w%(regular, bonus) }

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band
end
