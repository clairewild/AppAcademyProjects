require_relative 'base_class'

class User < BaseClass
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil if user.empty?
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil if user.empty?
    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        COUNT(DISTINCT (questions.id)) AS q_num,
        COUNT(question_likes.user_id) AS total_likes
      FROM
        questions
      LEFT JOIN
        question_likes
      ON (questions.id = question_likes.question_id)
      WHERE
        questions.user_id = ?
    SQL
    return nil if karma.empty?
    karma.first['total_likes'].to_f / karma.first['q_num']
  end

  # def save
  #   if @id.nil?
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
  #       INSERT INTO
  #         users (fname, lname)
  #       VALUES
  #         (?, ?)
  #     SQL
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   else
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
  #       UPDATE
  #         users
  #       SET
  #         fname = ?,
  #         lname = ?
  #       WHERE
  #         id = ?
  #     SQL
  #   end
  # end
end
