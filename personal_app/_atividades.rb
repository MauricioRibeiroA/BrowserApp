require 'sqlite3'


class Atividade
  attr_accessor :descricao
  attr_reader :id, :created_at, :updated_at

  def initialize(args={})
    @id = args.fetch("id", nil)
    @descricao = args.fetch('descricao', '')
    @created_at = args.fetch('created_at', Time.now)
    @updated_at = args.fetch('updated_at', Time.now)
  end



  def self.all
    activities = $db.execute('select * from atividades')
    db_obj = activities.map do |activity|
      Atividade.new(activity)
    end
    db_obj
  end

end