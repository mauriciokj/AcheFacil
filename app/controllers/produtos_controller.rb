class ProdutosController < ApplicationController
  active_scaffold :produto do |conf|
    conf.columns = [:nome, :quantidade, :preco, :codigo_de_barras, :nivel]
    conf.columns[:nivel].form_ui = :select
  end

  def pesquisa_produto_por_codigo_de_barra
    @ambiente = Ambiente.first
    @prateleira = Produto.find_by_codigo_de_barras(params[:codigo_de_barras]).nivel.prateleira
    render :action => "prateleiras"
  end
end 