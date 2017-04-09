# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :rentals,
    primary_key: :id,
    foreign_key: :renter_id,
    class_name: :Rental

  has_one :car,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Car

  has_many :rented_cars,
    through: :rentals,
    source: :car
end
