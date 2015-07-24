require './grape_juice'

run GrapeJuice

GrapeJuiceV4 = Class.new Grape::API

GrapeJuiceV4.format :json
GrapeJuiceV4.version 'v4', using: :path
[:users, :statuses].each do |api_resource|
  GrapeJuiceV4.resource api_resource do
    GrapeJuiceV4.get do
      { :action => "#{api_resource} v4 index" }
    end

    GrapeJuiceV4.params do
      requires :id, type: Integer, desc: "#{api_resource} id."
    end
    GrapeJuiceV4.get ":id" do
      { :action => "#{api_resource} v4 action" }
    end
  end
end

GrapeJuice.mount GrapeJuiceV4
