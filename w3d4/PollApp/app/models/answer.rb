# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  text        :string           not null
#  question_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
  validates :text, :question_id, presence: true

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :Response
end
