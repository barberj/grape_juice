require './grape_juice_v1'
require './grape_juice_v2'
require 'pry'

GrapeJuiceV3 = Class.new Grape::API

GrapeJuiceV3.format :json
GrapeJuiceV3.version 'v3', using: :path
[:users, :statuses].each do |api_resource|
  GrapeJuiceV3.resource api_resource do
    GrapeJuiceV3.get do
      { :action => "#{api_resource} v3 index" }
    end

    GrapeJuiceV3.params do
      requires :id, type: Integer, desc: "#{api_resource} id."
    end
    GrapeJuiceV3.get ":id" do
      { :action => "#{api_resource} v3 action" }
    end
  end
end

class GrapeJuice < Grape::API
  ObjectSpace.each_object(::Class).each do |klass|
    next if [GrapeJuice, Grape::API].include? klass
    mount klass if klass < Grape::API
  end
end
