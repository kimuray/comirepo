require 'csv'

class InsertComicBatch
  def self.execute
    Dir.chdir('lib/comic_list') do
      Dir.glob('*').each do |file|
        table = CSV.table(file)
        table.each do |record|
          Comic.bulk_insert do |worker|
            title_kana = ''
            title_en = ''
            if record[:title_en].blank?
              title_kana = to_kana(record[:title])
              title_en = record[:title_furigana]
            else
              title_kana = record[:title_furigana]
              title_en = record[:title_en]
            end
            attr = {
              title: record[:title],
              title_kana: title_kana.gsub(/ |　/, ''),
              title_en: title_en,
              initial_char: title_kana[0]
            }
            worker.add(attr)
          end
        end
      end
    end
  end

  def self.to_kana(val)
    val.tr('ァ-ン', 'ぁ-ん')
  end
end
