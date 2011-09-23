APSSueldos::Application.routes.draw do |map|

  resources :numeradors

  devise_for :users do
    get '/login' => 'devise/sessions#new', :as => :login
    get '/logout' => 'devise/sessions#destroy', :as => :logout
  end

  resources :users

  resources :sicoss_format_employers

  resources :sicoss_formats

  resources :sicoss_regimen_types

  resources :sicoss_reduction_zones

  resources :sicoss_locations

  resources :sicoss_damageds

  resources :sicoss_contract_modes

  resources :sicoss_activities

  resources :sicoss_conditions

  resources :sicoss_situations

  resources :sicoss_employer_types

  resources :siscoss_regimen_types

  resources :siscoss_regimen

  resources :siscoss_reduction_zones

  resources :siscoss_locations

  resources :siscoss_contract_modes

  resources :siscoss_activities

  resources :siscoss_conditions

  resources :siscoss_situations

  resources :siscoss_employer_types

  resources :syscoss_regimen_types

  resources :syscoss_regimen

  resources :syscoss_reduction_zones

  resources :syscoss_locations

  resources :syscoss_damageds

  resources :syscoss_contract_modes

  resources :syscoss_activities

  resources :syscoss_conditions

  resources :syscoss_situations

  resources :syscoss_employer_types

  resources :employer_types

  resources :activities

  resources :kinships

  resources :associated_document_types

  resources :EmployeeDocumentsController

  map.resources :attachments    , :only => :show

  resources :causa_egresos

  resources :email_types

  resources :employees do
    resources :employee_familiars
    resources :employee_retention_concepts
    resources :employee_remunerative_concepts
  end
  resources :deduccion_ganancias_tables

  resources :tipo_recibos


  resources :categories do
    member do
      get "imprimir", :action => :print
    end
  end

  resources :liquidacions do
    resources :recibo_sueldos do
      resources :detalle_recibo_retencions
      resources :detalle_recibo_habers
      member do
        get "calculo_recibo", :action => :calculo_recibo
      end
      #member do
      #  get "imprimir", :action => :print
      #end
    end
  end

  resources :data_to_asks

  resources :group_remunerations

  resources :employer_contribution_concepts

  resources :retention_concepts

  resources :remunerative_concepts

  resources :activities, :path => 'Actividades'

  resources :insurance_beneficiaries

  resources :bank_deposits

  resources :educational_levels

  resources :group_employer_contributions

  resources :bank_deposit_account_types

  resources :insurance_companies

  resources :employments

  resources :accounting_imputations

  resources :contract_modes

  resources :home_abouts

  resources :cost_centers

  resources :group_retentions

  resources :remuneration_types

  resources :labor_unions

  resources :health_insurances

  resources :places

  resources :tasks

  resources :sections

  resources :character_services

  resources :countries

  resources :provinces

  resources :locations

  resources :marital_statuses

  resources :nationalities

  resources :issueds

  resources :document_types

  resources :menus
  resources :menu_roles
  resources :menu_users
  resources :user_authorizations
  resources :user_roles

  root :to => "liquidacions#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
