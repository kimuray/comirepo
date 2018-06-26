require 'nokogiri'
require 'anemone'
require 'CSV'

class ComicCrowler
  attr_reader :target_url, :moji

  CROWL_OPTION = {
    depth_limit: 1,
    delay: 3
  }

  def initialize(moji)
    @moji = moji
    @target_url = "https://sakuhindb.com/anime/j_manga_#{moji}.html"
  end

  def execute
    csv = CSV.open("./outputs/#{moji}_comic_index.csv", 'w')
    csv.puts ['title', 'title_furigana', 'title_en']
    Anemone.crawl(target_url, CROWL_OPTION) do |anemone|
      anemone.focus_crawl do |page|
        page.links.keep_if { |link| link.to_s.match(/jmanga/) }
      end

      anemone.on_every_page do |page|
        next if page.doc.title == "漫画  [ぬ]"
        title = comic_title(page)
        title_yomi, title_en = comic_title_yomigana(page)

        csv.puts [title, title_yomi, title_en]
      end
    end
    csv.close
  end

  private

  def comic_title(page)
    page.doc.at_css('tr.va_top').children[4].children[0].children.last.inner_text
  end

  def comic_title_yomigana(page)
    page.doc.at_css('tr.va_top').children[4].children[2].to_s.split(' / ')
  end

  class << self
    def execute(chars)
      chars.each do |char|
        comic_crowler = self.new(moji)
        comic_crowler.execute
      end
    end
  end
end

ComicCrowler.execute(ARGV)
