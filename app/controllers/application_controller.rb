class ApplicationController < ActionController::Base
  protect_from_forgery
  ActiveScaffold.set_defaults do |config|
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
    config.create.link.label = "Adicionar novo registro"
    config.search.link.label = "Pesquisar"

    config.show.link.label = "Exibir"
    config.update.link.label = "Editar"
    config.delete.link.label = "Remover"

  end


  def empresa_logada
    Empresa.find(1)
  end

end
