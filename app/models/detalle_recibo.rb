class DetalleRecibo < ActiveRecord::Base
belongs_to :detallable, :polymorphic => true
end
