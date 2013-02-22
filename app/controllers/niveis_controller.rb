class NiveisController < ApplicationController
  active_scaffold :nivel do |conf|
    conf.columns = [:prateleira, :descricao]
    conf.columns[:prateleira].form_ui = :select
    conf.columns[:prateleira].clear_link
  end
end 