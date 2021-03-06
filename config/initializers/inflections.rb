# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'empresa', 'empresas'
   inflect.irregular 'prateleira', 'prateleiras'
   inflect.irregular 'nivel', 'niveis'
   inflect.irregular 'produto', 'produtos'
   inflect.irregular 'nivel_produto', 'niveis_produtos'
   inflect.irregular 'configuracao_boleto', 'configuracoes_boletos'

#   inflect.uncountable %w( fish sheep )
 end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
