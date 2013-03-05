class AmbientesController < ApplicationController

  active_scaffold :ambiente do |conf|
    conf.columns = [:nome, :altura, :comprimento, :largura]
    conf.nested.add_link(:prateleiras)
  end


  def before_create_save(record)
    record.empresa = empresa_logada
  end

  def seleciona_ambiente
    numero_de_ambientes = empresa_logada.ambientes.count
    if numero_de_ambientes == 1
      @ambiente = Ambiente.first
      render :action => "posiciona"
    else
      @ambientes = empresa_logada.ambientes
    end
  end

  def posiciona
    @ambiente = Ambiente.find(params[:id])
  end

  def vincula_prateleira
    puts "ENTROU AQUI"
    prateleira = Prateleira.find(params[:drag_id].delete("prateleira_"))
    estilo = $2 if params[:style] =~ /; width: (\d*)px;(...*)/

    prateleira.style = estilo
    prateleira.save

    render :nothing => true
  end


  def conditions_for_collection
    ["ambientes.empresa_id = ?", empresa_logada.id]
  end

  #def joins_for_collection
  #  "JOIN Cotacoes ON (Coberturas.Cotacao_ID = Cotacoes.ID)" +
  #      "JOIN Usuarios ON (Cotacoes.Usuario_ID   = Usuarios.ID) "
  #end

end