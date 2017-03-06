require_relative '_config'

module AtividadeSetup
  def self.create_atividades_table
    # Drop the table if it exists ... we'll recreate it.
    $db.execute("DROP TABLE IF EXISTS atividades")

    # Create the atividades table.
    $db.execute(
      <<-QUERY_STRING
        CREATE TABLE atividades (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          descricao VARCHAR(264) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      QUERY_STRING
    )
  end

  def self.seed
    #Delete existing records from the atividades table before inserting these new records; we'll start from scratch.
    $db.execute("DELETE FROM atividades")

    # Insert records.
    $db.execute(
      <<-QUERY_STRING
        INSERT INTO atividades
          (descricao, created_at, updated_at)
        VALUES
          ('testing the seed method', DATETIME('now'), DATETIME('now'));
      QUERY_STRING
    )

  end
end