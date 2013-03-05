# encoding : utf-8
class ImportaFilmesBlitz
  require 'mechanize'

  attr_accessor :agent, :pag, :menu_generos, :genero, :links_por_genero, :site

  def initialize
    self.links_por_genero = {}
    self.site = "http://blitzvideo.com.br/"
    self.agent = Mechanize.new { |a|
      a.user_agent_alias = 'Windows IE 9'
      a.verify_mode = OpenSSL::SSL::VERIFY_NONE
    }
  end

  def importar
    acessa_site
    menu
    cria_filme

  end


  def acessa_site
    self.pag = agent.post(site)
  end

  def menu
    self.menu_generos = self.pag.search('table[@class=MENU_BuscaBorda]')[2]

    self.menu_generos.search('a').each do |c|
      query = c.attributes['href']
      nome = c.children.to_s.unpack('C*').pack('U*')
      abre_genero(query, nome)
    end
  end

  def abre_genero(query='', genero='')
    #&pg=1
    self.pag = agent.post('http://blitzvideo.com.br/' + query)
    nro_de_paginas = self.pag.body.scan(/<b>P&aacute;g&nbsp;1\/(\d*)<\/b>/).first.first rescue 0
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>"
    puts "#{nro_de_paginas} paginas no genero #{genero}"
    self.links_por_genero[genero] = []
    (1..nro_de_paginas.to_i).each do |pagina|
      puts "Pagina #{pagina} no genero #{genero}"
      self.pag = agent.post(self.site+ query + "&pg=#{pagina}")
      self.pag.search('td[@class=CNT1]').search('td[@class=CNT1]').search('a').each do |a|
        self.links_por_genero[genero] << a.attributes['href'].to_s if a.attributes['href'].to_s.include? 'dados'
      end
    end
  end

  def cria_filme
    chaves = links_por_genero.keys

    chaves.each do |genero|
      links_por_genero[genero].each do |link|
        puts link
        atores = []
        self.pag = agent.post(self.site + link)
        titulo = self.pag.search('b[@id=DFTitulo]')[0].children[0].text rescue "sem titulo"
        titulo_original = self.pag.search('b[@id=DFTori]')[0].children[0].text rescue "sem titulo original"
        diretor = self.pag.search('td[@class=CNT1]')[1].children.children[0].text rescue "sem diretor"
        begin
          self.pag.search('td[@class=CNT1]')[2].children.children.each do |a|
            atores << a.text
          end
        rescue
          atores << "sem atores"
        end
        atores = atores * ', '
        sinopse = self.pag.search('div[@id=DFSinopse]')[0].children[3].text rescue "sem sinopse"
        descricao = "#{genero};#{titulo};#{titulo_original};#{diretor};#{atores}"
        puts ">>>>>>>>>>>>"
        puts descricao
        produto = Produto.find_or_initialize_by_descricao(descricao)
        produto.nome = "#{titulo}/#{titulo_original}"
        produto.save
      end
    end
  end

end