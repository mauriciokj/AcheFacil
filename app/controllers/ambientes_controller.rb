class AmbientesController < ApplicationController
  active_scaffold :ambiente do |conf|
    #conf.columns
  end

  def posiciona
    @ambiente = Ambiente.first
  end

  def vincula_prateleira
    prateleira = Prateleira.find(params[:drag_id].delete("prateleira_"))
    prateleira.style = params[:style]
    valor = eval( params[:valor])
    prateleira.x = valor[:x]
    prateleira.y = valor[:y]
    prateleira.save

    render:nothing => true
  end
end