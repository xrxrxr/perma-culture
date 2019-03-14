# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class Scrapper

  def get_post_titles_and_urls
    hashtitresurl = []
    urls = []
    full_urls = []
    titres = []

    doc = Nokogiri::HTML(open('https://www.ekopedia.fr/wiki/Portail%3APermaculture'))
    doc.xpath('//a').each do |node|
      urls << node['href']
      titres << node.text
    end
    titres.pop(120) && titres.shift(15)
    urls.pop(120) && urls.shift(15)

    urls.each do |url|
      full_urls << "https://www.ekopedia.fr#{url}" 
    end

    titres.size.times do |i|
      hashtitresurl << { title: titres[i], url: full_urls[i] }
    end
    hashtitresurl
  end
   
  def scrap_pages(hash_title_urls)

    hash_title_urls.each do |hash|
      unless hash[:url].include?('index.php?')
      	doc = Nokogiri::HTML(open(hash[:url]))
        Article.create!(title:hash[:title], content: doc.xpath('//*[@id="mw-content-text"]').children)
      end
    end
  end

  def perform
    scrap_pages(get_post_titles_and_urls)
  end
end
