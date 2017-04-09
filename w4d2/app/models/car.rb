# == Schema Information
#
# Table name: cars
#
#  id       :integer          not null, primary key
#  yr       :integer          not null
#  make     :string           not null
#  model    :string           not null
#  owner_id :integer          not null
#  color    :string           not null
#

class Car < ActiveRecord::Base
  validates :yr, :make, :model, :color, :owner_id, presence: true

  has_many :rentals,
    primary_key: :id,
    foreign_key: :car_id,
    class_name: :Rental

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :User

  has_many :renters,
    through: :rentals,
    source: :renter
end
