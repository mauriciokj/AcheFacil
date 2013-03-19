class ProdutosController < ApplicationController
  active_scaffold :produto do |conf|
    conf.columns = [:nome, :descricao, :quantidade, :preco, :codigo_de_barras, :niveis]
    conf.columns[:niveis].form_ui = :select
  end

  def pesquisa
    puts ">>>>>>>>>>>>>>>>> ENTROU AQUI"
    puts params.inspect
    @ambiente = Ambiente.find_by_id(params[:ambiente])
    puts @ambiente.inspect
    tipo = params[:tipo]
    puts
    if tipo == "ID" && @produto.blank?
      @produto = (Produto.find_by_id(params[:valor])) rescue nil
    else
      @produto = (Produto.find_by_codigo_de_barras(params[:valor])) rescue nil
    end
    #puts @produto.inspect
    #puts  @ambiente.blank?
    #puts @produto.em_mais_de_um_ambiente?
    if @ambiente.blank? && (@produto.em_mais_de_um_ambiente? rescue false)
      puts "retorno os ambientes"
      @ambientes = @produto.ambientes
      render :action => "ambientes"
    else

      if !@produto.blank?
        @ambiente = @produto.ambientes.first
        @prateleiras = []
        @produto.niveis.each do |nivel|
          @prateleiras << nivel.prateleira.id
        end
        render :action => "prateleiras"
      else
        @produtos = Produto.where("nome ilike '%#{params[:valor]}%' or descricao ilike '%#{params[:valor]}%'")
        render :action => "produtos"
      end
    end
  end

  def pesquisa_produto_por_codigo_de_barra
    #@ambiente = Ambiente.first
    @produto = Produto.find_by_codigo_de_barras(params[:codigo_de_barras])
    @prateleiras = []
    @produto.niveis.each do |nivel|
      @prateleiras << nivel.prateleira.id
    end

    render :action => "prateleiras"
  end

  def seleciona_prateleira
    puts ".............."
    puts params.inspect
    @produto = Produto.find(params[:produto_id])
    @prateleira = Prateleira.find(params[:prateleira_id].delete("prateleira_"))
    puts @produto.id
    puts @prateleira.id
    @niveis = @produto.nivel(@prateleira)
    @selecionada = params[:selecionada]
    render :action => 'prateleira_selecionada'
  end
end 
