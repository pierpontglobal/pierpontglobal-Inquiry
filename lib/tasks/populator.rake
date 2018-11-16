# frozen_string_literal: true

require './lib/data_populator.rb'

namespace :populator do
  include DataPopulator
  desc "Pupulates the database with cars information"
  task populate: :environment do
    DataPopulator.populate_data('./CQA_Basic.csv')
  end

  task filter: :environment do
    puts 'Initiating removals'
    DataPopulator.filter_availabilities
    puts 'Finished'
  end
end
