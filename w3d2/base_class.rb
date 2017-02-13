class BaseClass

  def self.find_by_id(id, table_name)
    datum = QuestionsDatabase.instance.execute(<<-SQL, table_name, id)
      SELECT
        *
      FROM
        table_name
      WHERE
        id = ?
    SQL
    return nil if datum.empty?
    self.class.new(datum.first)
  end

  def self.all(table_name)
    data = QuestionsDatabase.instance.execute("SELECT * FROM #{table_name}")
    data.map { |datum| self.class.new(datum) }
  end

  def save(table_name)
    instance_vars = self.instance_variables.map(&:to_s)
    column_names = instance_vars.map { |name| name[1..-1] }
    p instance_vars.join(", ")
    value_string = ""
    column_names.each { |name| value_string += name + " = ?," }
    p value_string = value_string[0..-2]

    # if @id.nil?
    #   QuestionsDatabase.instance.execute(<<-SQL, table_name, #{instance_vars})
    #     INSERT INTO
    #       table_name
    #     VALUES
    #       #{value_string}
    #   SQL
    #   @id = QuestionsDatabase.instance.last_insert_row_id
    # else
    #   QuestionsDatabase.instance.execute(<<-SQL,table_name, @id)
    #     UPDATE
    #       table_name
    #     SET
    #
    #     WHERE
    #       id = ?
    #   SQL
  end

end
