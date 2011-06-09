class TipoRecibo < ActiveRecord::Base
  has_many :liquidacions
end
