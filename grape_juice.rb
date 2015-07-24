require './grape_juice_v1'
require './grape_juice_v2'

class GrapeJuice < Grape::API
  mount GrapeJuiceV1
  mount GrapeJuiceV2
end
