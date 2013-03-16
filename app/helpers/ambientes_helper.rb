module AmbientesHelper

  def imagem_chao_form_column(record, column)
    imagem = "<ul class='seleciona_chao'>"
    imagem << "<li>#{radio_button_tag "record[imagem_chao]",  "piso01.jpg", record.imagem_chao == 'piso01.jpg'}"
    imagem << "#{image_tag('pisos/piso01.jpg')}</li>"
    imagem << "<li>#{radio_button_tag "record[imagem_chao]",  "piso02.jpg", record.imagem_chao == 'piso02.jpg'}"
    imagem << "#{image_tag('pisos/piso02.jpg')}</li>"
    imagem << "<li>#{radio_button_tag "record[imagem_chao]",  "piso03.jpg", record.imagem_chao == 'piso03.jpg'}"
    imagem << "#{image_tag('pisos/piso03.jpg')}</li>"
    imagem << "</ul>"
    imagem

  end

end
