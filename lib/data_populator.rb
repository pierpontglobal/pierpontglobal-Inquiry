# frozen_string_literal: true

module DataPopulator
  def self.populate_data(file)
    text = File.open(file).read
    text.each_line do |line|
      line_split = line.gsub(/[\n\r]/, '').split(',')
      maker_s = line_split[1]
      model_s = line_split[2]
      model_y = line_split[4]

      maker = Maker.where(
        title: capitalize_first_letters(maker_s)
      ).first_or_create!
      Model.where(title: model_s, year: model_y, maker: maker).first_or_create!
    end
    'DONE ===> END <==='
  end

  def self.capitalize_first_letters(word)
    sections = word.split(' ')
    capitalized_word = ''
    sections.each do |section|
      (capitalized_word += section.capitalize + ' ') unless section.blank?
    end
    capitalized_word.chop!
  end
end
