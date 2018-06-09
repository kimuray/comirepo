class ImageGenerator
  attr_accessor :image

  BASE_IMAGE = 'lib/assets/images/base_image.png'
  USE_FONT = 'lib/assets/fonts/GenEiLateGo_v2.ttc'
  OUTPUT_DIR = 'public/outputs'

  def initialize
    @image = MiniMagick::Image.open(BASE_IMAGE)
  end

  def create(text, file_name: 'comirepo')
    image.combine_options do |option|
      option.gravity 'north'
      option.draw "text 0,0 '#{text}'"
      option.font USE_FONT
    end
    image.write("#{OUTPUT_DIR}/#{file_name}.png")
  end
end
