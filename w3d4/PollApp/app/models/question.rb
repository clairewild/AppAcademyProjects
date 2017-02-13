# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answers,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Answer

  has_many :responses,
    through: :answers,
    source: :responses

  def results
    answers_with_counts = self
      .answers.select("answers.text, COUNT(responses.id) AS responses_count").distinct
      .joins("LEFT OUTER JOIN responses ON answers.id = responses.answer_id")
      .group("answers.text")

    answers_with_counts.map do |answer|
      [answer.text, answer.responses_count]
    end
  end
end
