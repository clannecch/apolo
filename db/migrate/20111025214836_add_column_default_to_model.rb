class AddColumnDefaultToModel < ActiveRecord::Migration
  def self.up
    add_column :contract_modes, :default, :boolean
    add_column :accounting_imputations, :default, :boolean
    add_column :activities, :default, :boolean
    add_column :associated_document_types, :default, :boolean
    add_column :bank_deposit_account_types, :default, :boolean
    add_column :bank_deposits, :default, :boolean
    add_column :causa_egresos, :default, :boolean
    add_column :character_services, :default, :boolean
    add_column :cost_centers, :default, :boolean
    add_column :document_types, :default, :boolean
    add_column :educational_levels, :default, :boolean
    add_column :email_types, :default, :boolean
    add_column :employments, :default, :boolean
    add_column :group_employer_contributions, :default, :boolean
    add_column :group_remunerations, :default, :boolean
    add_column :group_retentions, :default, :boolean
    add_column :home_abouts, :default, :boolean
    add_column :insurance_companies, :default, :boolean
    add_column :issueds, :default, :boolean
    add_column :kinships, :default, :boolean
    add_column :labor_unions, :default, :boolean
    add_column :locations, :default, :boolean
    add_column :marital_statuses, :default, :boolean
    add_column :nationalities, :default, :boolean
    add_column :places, :default, :boolean
    add_column :remuneration_types, :default, :boolean
    add_column :sections, :default, :boolean
    add_column :tasks, :default, :boolean
end

  def self.down
    remove_column :tasks, :default
    remove_column :sections, :default
    remove_column :remuneration_types, :default
    remove_column :places, :default
    remove_column :nationalities, :default
    remove_column :marital_statuses, :default
    remove_column :locations, :default
    remove_column :labor_unions, :default
    remove_column :kinships, :default
    remove_column :issueds, :default
    remove_column :insurance_companies, :default
    remove_column :home_abouts, :default
    remove_column :group_retentions, :default
    remove_column :group_remunerations, :default
    remove_column :group_employer_contributions, :default
    remove_column :employments, :default
    remove_column :email_types, :default
    remove_column :educational_levels, :default
    remove_column :document_types, :default
    remove_column :cost_centers, :default
    remove_column :character_services, :default
    remove_column :causa_egresos, :default
    remove_column :bank_deposits, :default
    remove_column :bank_deposit_account_types, :default
    remove_column :associated_document_types, :default
    remove_column :activities, :default
    remove_column :accounting_imputations, :default
    remove_column :contract_modes, :default
  end
end
