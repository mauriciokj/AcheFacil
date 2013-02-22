class ProdutosController < ApplicationController
  active_scaffold :produto do |conf|
    conf.columns = [:nome, :quantidade, :preco, :codigo_de_barras, :nivel]
    conf.columns[:nivel].form_ui = :select
  end

  def pesquisa_produto_por_codigo_de_barra
    @ambiente = Ambiente.first
    @produto = Produto.find_by_codigo_de_barras(params[:codigo_de_barras])
    @prateleira = @produto.nivel.prateleira
    render :action => "prateleiras"
  end

  def seleciona_prateleira
    puts ">>>>>>>>>>>>>"
    puts params.inspect
    @produto = Produto.find(params[:produto_id])
    @prateleira = Prateleira.find(params[:prateleira_id].delete("prateleira_" ))
    @nivel = @produto.nivel
    render :action => 'prateleira_selecionada'
  end
end 