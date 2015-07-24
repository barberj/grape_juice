require './grape_juice_v1'
require './grape_juice_v2'
require 'pry'

class GrapeJuice < Grape::API
  ObjectSpace.each_object(::Class).each do |klass|
    next if [GrapeJuice, Grape::API].include? klass
    mount klass if klass < Grape::API
  end
end
