class QuestionFollow
  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    question_f = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil if question_f.empty?
    QuestionFollow.new(question_f.first)
  end

  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users
      ON
        question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL
    return nil if users.empty?
    users.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users
      ON
        question_follows.user_id = users.id
      WHERE
        question_follows.user_id = ?
    SQL
    return nil if questions.empty?
    questions.map { |datum| Question.find_by_id(datum['question_id']) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.id, questions.title, questions.body, questions.user_id
      FROM
        question_follows
      JOIN
        questions
      ON
        question_follows.question_id = questions.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(questions.user_id) DESC
      LIMIT
        ?
    SQL
    return nil if questions.empty?
    questions.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
