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
      model = Model.where(title: model_s, year: model_y, maker: maker).first_or_create!
      puts "#{maker.title} || #{model.title} || #{model.year}"
    end
  end

  def self.filter_availabilities
    ActiveRecord::Base.connection.execute("DELETE FROM ConsultCar_development.models WHERE maker_id in (SELECT id FROM ConsultCar_development.makers where title in ('AC',
                                          'Allard','Alpine','Alvis','AMC','Ariel','Armstrong-siddeley','Ascan', 'Austin','Autobianchi','Auverland','Avanti','Berkeley','Bitter',
                                          'Bizzarrini','Brilliance','Bristol','Caterham','Checker','Chrysler','Dacia','Daf','Daihatsu','Daimler','De-Tomaso','Dkw','Donkenvoort',
                                          'Eagle','Fairthorpe','Gaz','Geely','Ginetta','Holden','Hudson','Humber','Innocenti','Italdesign','Jensen','Lada','Lancia','Lotec',
                                          'Mahindra','Marcos','Matra-simca','Mcc','Mercury','Mg','Monteverdi','Moretti','Morgan','Morris','Noble','Nsu','Oldsmobile','Opel',
                                          'Packard','Panoz','Peugeot','Pininfarina','Plymouth','Pontiac','Proton','Reliant','Renault','Riley','Rover','Saab','Samsung','Saturn',
                                          'Seat','Simca','Singer','Skoda','Ssangyong','Steyr','Studebaker','Sunbeam','Tailbot','Tata','Tarta','Trabajant','Tvt','Vauxhall',
                                          'Vector','Venturi','Wartburg','Westfield','Willys-overland','Xedos','Zagato','Zastava','Zaz','Zil','Zenvo','Luxgen','Ssc','Model_make_id'))")

    ActiveRecord::Base.connection.execute("DELETE FROM ConsultCar_development.makers WHERE title IN ('AC',
                                          'Allard','Alpine','Alvis','AMC','Ariel','Armstrong-siddeley','Ascan','Austin',
                                          'Autobianchi','Auverland','Avanti','Berkeley','Bitter','Bizzarrini','Brilliance',
                                          'Bristol','Caterham','Checker','Chrysler','Dacia','Daf','Daihatsu','Daimler',
                                          'De-Tomaso','Dkw','Donkenvoort','Eagle','Fairthorpe','Gaz', 'Geely','Ginetta',
                                          'Holden','Hudson','Humber','Innocenti','Italdesign','Jensen','Lada','Lancia',
                                          'Lotec','Mahindra','Marcos','Matra-simca','Mcc','Mercury','Mg','Monteverdi',
                                          'Moretti','Morgan','Morris','Noble','Nsu','Oldsmobile','Opel','Packard','Panoz',
                                          'Peugeot','Pininfarina','Plymouth','Pontiac','Proton','Reliant','Renault','Riley',
                                          'Rover','Saab','Samsung','Saturn','Seat','Simca','Singer','Skoda','Ssangyong',
                                          'Steyr','Studebaker','Sunbeam','Tailbot','Tata','Tarta','Trabajant','Tvt',
                                          'Vauxhall','Vector','Venturi','Wartburg','Westfield','Willys-overland','Xedos',
                                          'Zagato','Zastava','Zaz','Zil','Zenvo','Luxgen','Ssc', 'Model_make_id');")
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
