require 'uri'
require 'net/http'
require 'nokogiri'

uri = URI('https://www.goodreads.com/review/list_rss/3102212?key=9htK1GIRzQgSou2ZmyJ1UTDI37S8PvkV7kI9NXZ8d1U4dzMi&shelf=my-top')
res = Net::HTTP.get_response(uri)
parsed = Nokogiri::XML(res.body)

full_string = ""

parsed.xpath('//item').each do |book|
    title = '- title: ' + book.at_xpath('title').content.dump
    link = '  link: ' + book.at_xpath('link').content.dump
    cover = '  cover: ' + book.at_xpath('book_large_image_url').content.dump
    author = '  author: ' + book.at_xpath('author_name').content.dump
    block = title + "\n" + link + "\n" + cover + "\n" + author + "\n\n"
    full_string += block
end

File::write('_data/books.yml', full_string)