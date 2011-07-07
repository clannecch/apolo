class AddCompanyToAllModels < ActiveRecord::Migration
  def self.up
    add_column "accounting_imputations", "company_id", :integer
    add_column "bank_deposit_account_types", "company_id", :integer
    add_column "bank_deposits", "company_id", :integer
    add_column "categories", "company_id", :integer
    add_column "causa_egresos", "company_id", :integer
    add_column "character_services", "company_id", :integer
    add_column "contract_modes", "company_id", :integer
    add_column "cost_centers", "company_id", :integer
    add_column "countries", "company_id", :integer
    add_column "data_to_asks", "company_id", :integer
    add_column "deduccion_ganancias_tables", "company_id", :integer
    add_column "document_types", "company_id", :integer
    add_column "educational_levels", "company_id", :integer
    add_column "email_types", "company_id", :integer
    add_column "employees", "company_id", :integer
    add_column "employments", "company_id", :integer
    add_column "group_remunerations", "company_id", :integer
    add_column "group_retentions", "company_id", :integer
    add_column "health_insurances", "company_id", :integer
    add_column "home_abouts", "company_id", :integer
    add_column "insurance_companies", "company_id", :integer
    add_column "issueds", "company_id", :integer
    add_column "labor_unions", "company_id", :integer
    add_column "liquidacions", "company_id", :integer
    add_column "locations", "company_id", :integer
    add_column "marital_statuses", "company_id", :integer
    add_column "nationalities", "company_id", :integer
    add_column "places", "company_id", :integer
    add_column "provinces", "company_id", :integer
    add_column "remuneration_types", "company_id", :integer
    add_column "remunerative_concepts", "company_id", :integer
    add_column "retention_concepts", "company_id", :integer
    add_column "sections", "company_id", :integer
    add_column "tasks", "company_id", :integer
    add_column "tipo_recibos", "company_id", :integer

  end

  def self.down
    remove_column "accounting_imputations", "company_id"
    remove_column "bank_deposit_account_types", "company_id"
    remove_column "bank_deposits", "company_id"
    remove_column "categories", "company_id"
    remove_column "causa_egresos", "company_id"
    remove_column "character_services", "company_id"
    remove_column "contract_modes", "company_id"
    remove_column "cost_centers", "company_id"
    remove_column "countries", "company_id"
    remove_column "data_to_asks", "company_id"
    remove_column "deduccion_ganancias_tables", "company_id"
    remove_column "document_types", "company_id"
    remove_column "educational_levels", "company_id"
    remove_column "email_types", "company_id"
    remove_column "employees", "company_id"
    remove_column "employments", "company_id"
    remove_column "group_remunerations", "company_id"
    remove_column "group_retentions", "company_id"
    remove_column "health_insurances", "company_id"
    remove_column "home_abouts", "company_id"
    remove_column "insurance_companies", "company_id"
    remove_column "issueds", "company_id"
    remove_column "labor_unions", "company_id"
    remove_column "liquidacions", "company_id"
    remove_column "locations", "company_id"
    remove_column "marital_statuses", "company_id"
    remove_column "nationalities", "company_id"
    remove_column "places", "company_id"
    remove_column "provinces", "company_id"
    remove_column "remuneration_types", "company_id"
    remove_column "remunerative_concepts", "company_id"
    remove_column "retention_concepts", "company_id"
    remove_column "sections", "company_id"
    remove_column "tasks", "company_id"
    remove_column "tipo_recibos", "company_id"
  end
end
