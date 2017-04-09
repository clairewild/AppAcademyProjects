# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares

  has_many :shared_owners,
    through: :contact_shares,
    source: :user

end
