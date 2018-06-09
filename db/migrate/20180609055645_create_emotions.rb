class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.transaction do
      create_table :emotions do |t|
        t.string :name

        t.timestamps
      end

      Emotion.create(name: '期待')
      Emotion.create(name: '癒し')
      Emotion.create(name: '怒り')
      Emotion.create(name: '嫌悪')
      Emotion.create(name: 'エモい')
      Emotion.create(name: '喜び')
      Emotion.create(name: '恐れ')
      Emotion.create(name: '驚き')
      Emotion.create(name: '悲しみ')
      Emotion.create(name: 'エロい')
    end
  end
end
