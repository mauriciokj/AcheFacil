class PrateleirasController < ApplicationController

  active_scaffold :prateleira do |conf|

    conf.columns = [:descricao, :imagem, :posicao, :comprimento, :largura, :ambiente, :quantidade_de_niveis]
    conf.list.columns.exclude :ambiente, :niveis
    conf.list.columns << :quantidade_de_niveis
    conf.update.columns.exclude :quantidade_de_niveis
    conf.update.columns << :niveis
    conf.columns[:ambiente].form_ui = :select
    conf.columns[:posicao].form_ui = :select
    conf.columns[:posicao].options = {:options => [[Prateleira::VERTICAL.humanize, Prateleira::VERTICAL], [Prateleira::HORIZONTAL.humanize, Prateleira::HORIZONTAL]]}
    conf.nested.add_link :niveis

  end

  def vincular_produtos
    @prateleiras = empresa_logada.prateleiras
    render :action => 'vincular_produtos'
  end


  def seleciona_prateleira_produto
    @prateleira = Prateleira.find_by_id(params[:id])
    render formats => [:js]
  end
end