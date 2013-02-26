class AmbientesController < ApplicationController
  active_scaffold :ambiente do |conf|
    conf.columns = [:nome, :altura, :comprimento, :largura]
  end

  def posiciona
    @ambiente = Ambiente.first
  end

  def vincula_prateleira
    prateleira = Prateleira.find(params[:drag_id].delete("prateleira_"))
    estilo = $2 if params[:style] =~ /; width: (\d*)px;(...*)/
    puts ">>>>>>>>>>>>>>>>"
    puts estilo
    prateleira.style = estilo
    #valor = eval( params[:valor])
    #prateleira.x = valor[:x]
    #prateleira.y = valor[:y]
    prateleira.save

    render:nothing => true
  end
end