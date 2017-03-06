require_relative '_config'
require_relative '_atividades'
require_relative '_atividades_db_setup'

p AtividadeSetup.create_atividades_table

p AtividadeSetup.seed

p Atividade.all