class AddCodeToModels < ActiveRecord::Migration
  def self.up
    add_column :contract_modes, :code, :string
    add_column :accounting_imputations, :code, :string
    add_column :activities, :code, :string
    add_column :associated_document_types, :code, :string
    add_column :bank_deposit_account_types, :code, :string
    add_column :bank_deposits, :code, :string
    add_column :causa_egresos, :code, :string
    add_column :character_services, :code, :string
    add_column :cost_centers, :code, :string
    add_column :document_types, :code, :string
    add_column :educational_levels, :code, :string
    add_column :email_types, :code, :string
    add_column :employments, :code, :string
    add_column :group_employer_contributions, :code, :string
    add_column :group_remunerations, :code, :string
    add_column :group_retentions, :code, :string
    add_column :home_abouts, :code, :string
    add_column :insurance_companies, :code, :string
    add_column :issueds, :code, :string
    add_column :kinships, :code, :string
    add_column :labor_unions, :code, :string
    add_column :locations, :code, :string
    add_column :marital_statuses, :code, :string
    add_column :nationalities, :code, :string
    add_column :places, :code, :string
    add_column :remuneration_types, :code, :string
    add_column :sections, :code, :string
    add_column :tasks, :code, :string
end

  def self.down
    remove_column :tasks, :code
    remove_column :sections, :code
    remove_column :remuneration_types, :code
    remove_column :places, :code
    remove_column :nationalities, :code
    remove_column :marital_statuses, :code
    remove_column :locations, :code
    remove_column :labor_unions, :code
    remove_column :kinships, :code
    remove_column :issueds, :code
    remove_column :insurance_companies, :code
    remove_column :home_abouts, :code
    remove_column :group_retentions, :code
    remove_column :group_remunerations, :code
    remove_column :group_employer_contributions, :code
    remove_column :employments, :code
    remove_column :email_types, :code
    remove_column :educational_levels, :code
    remove_column :document_types, :code
    remove_column :cost_centers, :code
    remove_column :character_services, :code
    remove_column :causa_egresos, :code
    remove_column :bank_deposits, :code
    remove_column :bank_deposit_account_types, :code
    remove_column :associated_document_types, :code
    remove_column :activities, :code
    remove_column :accounting_imputations, :code
    remove_column :contract_modes, :code
  end
end
