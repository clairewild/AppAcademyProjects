# == Schema Information
#
# Table name: rentals
#
#  id         :integer          not null, primary key
#  renter_id  :integer          not null
#  car_id     :integer          not null
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rental < ActiveRecord::Base
  validates :renter_id, :car_id, :start_date, :end_date, presence: true
  validate :start_before_end

  def start_before_end
    if self.end_date < self.start_date
      self.errors[:start] << "must be before end"
    end
  end

  belongs_to :renter,
    primary_key: :id,
    foreign_key: :renter_id,
    class_name: :User

  belongs_to :car,
    class_name: :Car,
    primary_key: :id,
    foreign_key: :car_id
end
