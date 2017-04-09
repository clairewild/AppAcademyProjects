# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :respondent_already_answered

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :Answer

  has_one :question,
    through: :answer,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered
    if self.sibling_responses.where(user_id: self.user_id).exists?
      self.errors[:user_id] << "already responded"
    end
  end
end
