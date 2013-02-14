class PrateleirasController < ApplicationController

  active_scaffold :prateleira do |conf|

    conf.columns = [:descricao, :posicao,:ambiente, :quantidade_de_niveis]
    conf.list.columns.exclude :ambiente, :niveis
    conf.list.columns << :quantidade_de_niveis
    conf.update.columns.exclude :quantidade_de_niveis
    conf.update.columns << :niveis
    conf.columns[:ambiente].form_ui = :select
    conf.columns[:posicao].form_ui = :select
    conf.columns[:posicao].options = {:options => [[Prateleira::VERTICAL.humanize, Prateleira::VERTICAL], [Prateleira::HORIZONTAL.humanize,Prateleira::HORIZONTAL]]}
    conf.nested.add_link :niveis

  end


end