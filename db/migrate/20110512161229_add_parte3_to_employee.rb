class AddParte3ToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :fecha_ingreso, :date
    add_column :employees, :fecha_egreso, :date
    add_column :employees, :horas_pactadas, :decimal
    add_column :employees, :remuneracion_fuera_convenio, :decimal
    add_column :employees, :remuneration_type_id, :integer
    add_column :employees, :group_renuneration_id, :integer
    add_column :employees, :group_retention_id, :integer
    add_column :employees, :group_employercontribution_id, :integer
    add_column :employees, :cost_center_id, :integer
    add_column :employees, :antiguedad_reconocida_anos, :integer
    add_column :employees, :antiguedad_reconocida_meses, :integer
    add_column :employees, :retencion_minima_osocial, :decimal
    add_column :employees, :educational_level_id, :integer
    add_column :employees, :id_card, :integer
    add_column :employees, :numero_cofre, :string
    add_column :employees, :contract_mode_id, :integer
    add_column :employees, :home_about_id, :integer
    add_column :employees, :cuadras_asfalto, :integer
    add_column :employees, :domicilio_entre_calle_izquierda, :string
    add_column :employees, :domicilio_entre_calle_derecha, :string
    add_column :employees, :domicilio_entre_calles_detras, :string
    add_column :employees, :domicilio_avenida_cercana, :string
    add_column :employees, :domicilio_avenida_cercana_altura, :integer
    add_column :employees, :email_type_id, :integer
    add_column :employees, :employment_id, :integer
    add_column :employees, :accounting_imputation_id, :integer
    add_column :employees, :insurance_company_id, :integer
    add_column :employees, :seguro_conyuge, :string
    add_column :employees, :Seguro_numero_poliza, :string
    add_column :employees, :seguro_monto_asegurado, :decimal
    add_column :employees, :bank_deposit_id, :integer
    add_column :employees, :bank_deposit_account_type_id, :integer
    add_column :employees, :deposito_banco_cuenta, :string
    add_column :employees, :deposito_banco_cbu, :string
  end

  def self.down
    remove_column :employees, :deposito_banco_cbu
    remove_column :employees, :deposito_banco_cuenta
    remove_column :employees, :bank_deposit_account_type_id
    remove_column :employees, :bank_deposit_id
    remove_column :employees, :seguro_monto_asegurado
    remove_column :employees, :Seguro_numero_poliza
    remove_column :employees, :seguro_conyuge
    remove_column :employees, :insurance_company_id
    remove_column :employees, :accounting_imputation_id
    remove_column :employees, :employment_id
    remove_column :employees, :email_type_id
    remove_column :employees, :domicilio_avenida_cercana_altura
    remove_column :employees, :domicilio_avenida_cercana
    remove_column :employees, :domicilio_entre_calles_detras
    remove_column :employees, :domicilio_entre_calle_derecha
    remove_column :employees, :domicilio_entre_calle_izquierda
    remove_column :employees, :cuadras_asfalto
    remove_column :employees, :home_about_id
    remove_column :employees, :contract_mode_id
    remove_column :employees, :numero_cofre
    remove_column :employees, :id_card
    remove_column :employees, :educational_level_id
    remove_column :employees, :retencion_minima_osocial
    remove_column :employees, :antiguedad_reconocida_meses
    remove_column :employees, :antiguedad_reconocida_anos
    remove_column :employees, :cost_center_id
    remove_column :employees, :group_employercontribution_id
    remove_column :employees, :group_retention_id
    remove_column :employees, :group_renumbering_id
    remove_column :employees, :remuneration_type_id
    remove_column :employees, :remuneracion_fuera_convenio
    remove_column :employees, :horas_pactadas
    remove_column :employees, :fecha_egreso
    remove_column :employees, :fecha_ingreso
  end
end
