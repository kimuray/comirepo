require 'nokogiri'
require 'anemone'
require 'CSV'

url = 'https://sakuhindb.com/anime/j_manga_nu.html'
opt = {
  depth_limit: 1,
  delay: 3
}

csv = CSV.open('./nu_comic_index.csv', 'w')
csv.puts ['title', 'title_furigana', 'title_en']

Anemone.crawl(url, opt) do |anemone|
  anemone.focus_crawl do |page|
    page.links.keep_if { |link| link.to_s.match(/jmanga/) }
  end

  anemone.on_every_page do |page|
    next if page.doc.title == "漫画  [ぬ]"
    title = page.doc.at_css('tr.va_top').children[4].children[0].children.last.inner_text
    title_yomi = page.doc.at_css('tr.va_top').children[4].children[2].to_s.split(' / ')

    csv.puts [title, title_yomi[0], title_yomi[1]]
  end
end

csv.close
