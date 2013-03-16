module PrateleirasHelper

  def imagem_form_column(record, column)
    imagem = "<ul class='seleciona_chao'>"
    imagem << "<li>#{radio_button_tag "record[imagem]",  "prateleira_metal", record.imagem == 'prateleira_metal'}"
    imagem << "#{image_tag('prateleiras/originais/prateleira_metal.jpeg')}</li>"
    imagem << "<li>#{radio_button_tag "record[imagem]",  "prateleira_madeira_01", record.imagem == 'prateleira_madeira_01'}"
    imagem << "#{image_tag('prateleiras/originais/prateleira_madeira_01.jpg')}</li>"
    imagem << "</ul>"
    imagem

  end
end