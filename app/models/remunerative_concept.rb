# == Schema Information
# Schema version: 20111013184648
#
# Table name: remunerative_concepts
#
#  id                               :integer         not null, primary key
#  codigo                           :string(255)
#  detalle                          :string(255)
#  porcentual_asistencia            :boolean
#  prioridad_calculo                :integer
#  statistical_value                :integer
#  grupo_ganancias_id               :integer
#  accounting_imputation_id         :integer
#  concepto_asociado_haber_id       :integer
#  concepto_asociado_retencion_id   :integer
#  concepto_asociado_haber_2_id     :integer
#  concepto_asociado_retencion_2_id :integer
#  created_at                       :datetime
#  updated_at                       :datetime
#  acumuladores_valor               :string(255)
#  acumuladores_cantidad            :string(255)
#  calculo_valor                    :string(255)
#  calculo_cantidad                 :string(255)
#  data_to_ask_id                   :integer
#  cantidad_en_recibo               :string(255)
#  company_id                       :integer
#  auxiliar                         :boolean
#

class RemunerativeConcept < ActiveRecord::Base
  paginates_per 10
  scope :by_company, lambda {|company| where(:company_id => company) }
  belongs_to :concepto_asociado_haber, :class_name => "RemunerativeConcept"
  belongs_to :concepto_asociado_retencion, :class_name => "RetentionConcept"
  belongs_to :concepto_asociado_haber_2, :class_name => "RemunerativeConcept"
  belongs_to :concepto_asociado_retencion_2, :class_name => "RetentionConcept"
  belongs_to :data_to_ask
  belongs_to :accounting_imputation
  has_many :detalle_recibo_habers, :dependent => :restrict
  has_and_belongs_to_many :group_remunerations
  validate :cannot_asociate_iqual_concept
#  validate :control_formula
  validates_presence_of :detalle, :codigo, :acumuladores_valor, :calculo_valor

  before_save :controlar_cambios

  @Recalcular = false

  def controlar_cambios
    @Recalcular = ( calculo_valor         != calculo_valor_was          ) ||
                  ( calculo_cantidad      != calculo_cantidad_was       ) ||
                  ( prioridad_calculo     != prioridad_calculo_was      ) ||
                  ( acumuladores_valor    != acumuladores_valor_was     ) ||
                  ( acumuladores_cantidad != acumuladores_cantidad_was  ) ||
                  ( data_to_ask_id        != data_to_ask_id_was)
    return true
  end

  def cambio_algo
    if @Recalcular
      total = 0
      Liquidacion.where(:fecha_cierre.nil?).each do |l|
        total += ReciboSueldo.joins(:detalle_recibo_habers).where(:liquidacion_id => l.id).where("detalle_recibo_habers.remunerative_concept_id" => self.id).count
      end
      if total < 1
        @Recalcular = false
      end
    end
    return @Recalcular
  end

  def control_formula
    modelos = ["novedad_haber", "empleado", "categoria" ]
    models = ["detalle_recibo_haber", "employee", "category" ]

    formula = self.calculo_valor.gsub(",",".")

    esvalido = (formula.gsub('(').count == formula.gsub(')').count)
    if !esvalido
      errors.add(:base, 'Parentesis no balanceados (Abren '+formula.gsub('(').count.to_s+
                ' y cierran '+formula.gsub('(').count.to_s+')' )
    else
      esvalido = (formula.gsub(' entonces ').count == formula.gsub(' sino ').count)
      if !esvalido
        errors.add(:base, 'Estructura de consulta no balanceada (entonces '+formula.gsub(' entonces ').count.to_s+
                  ' y sino '+formula.gsub(' sino ').count.to_s+')' )
      else
        esvalido = (formula.gsub('==').count == 0 && formula.gsub('==').count == 0)
        if !esvalido
          errors.add(:base, 'No puede utilizar "==" o ".."')
        end
      end
    end
    if esvalido
      while formula.include?(".")

        position = formula.index(".")
        if position > 0
          if !(formula[position-1] >="0" && formula[position-1] <= "9")
            formula[position]=('0,')
          else
            formula[position]=(',')
          end
        else
          formula[position]=('0,')
        end

      end
      formula = formula.gsub(/,/,".")
      xaeval = formula.gsub(" entonces ", " ? ").gsub(" sino "," : ")
      len = formula.length
      position = 0
      entidad = ""
      initial_position = 0
      while position < len && esvalido
        if " -+()*/@".include?(formula[position])
          entidad = ""
        else
          if formula[position] != ":"
            entidad = entidad + formula[position]
          end
        end
        if ":@".include?(formula[position])
          variable = ""
          initial_position = position
          while position < len && " -+()*/".exclude?(formula[position])
            variable = variable + formula[position]
            position =  position + 1
#            Rails.logger.info('variable: '+variable)
          end
#          Rails.logger.info('Paso2: '+variable+ " - "+position.to_s)
          position = position - 1
          if formula[initial_position]==":"
            if modelos.index(entidad).nil?
              errors.add(:base, 'Entidad no soportada : '+entidad+'.'+variable.gsub(":",""))
              esvalido = false
            else
              Rails.logger.info("eval: "+entidad[modelos.index(entidad)].classify+".column_names.index('"+variable.gsub(":","")+"').to_i")

              if !(eval(models[modelos.index(entidad)].classify+".column_names.index('"+variable.gsub(":","")+"').to_i") > 0)
                errors.add(:base, 'No pude resolver la entidad.columna '+entidad+'.'+variable.gsub(":",""))
                esvalido = false
              else
                case eval(models[modelos.index(entidad)].classify+".columns_hash['"+
                                variable.gsub(":","")+
                                "'].type")
                  when :date
                    xaeval = xaeval.gsub(entidad+variable, '"' + Date.today.to_param+ '"')
                  when :string
                    xaeval = xaeval.gsub(entidad+variable, '"' + position.to_s + '"')
                  when :boolean
                    xaeval = xaeval.gsub(entidad+variable, ' true ')
                  else
                    xaeval = xaeval.gsub(entidad+variable, position.to_s )
                end
              end
            end
          else
            xaeval = xaeval.gsub(variable,position.to_s)
          end
        end
        position = position +1
      end
      if esvalido
        begin
          eval(xaeval)
        rescue SyntaxError => se
          errors.add(:base, 'formula inconsistente : '+formula)
          errors.add(:base, 'Expresion evaluada : '+xaeval)
        rescue ZeroDivisionError => zd
          errors.add(:base, 'formula con Division por 0(cero). Formula : '+formula)
        end
      end
    end
    self.calculo_valor = formula
    if !esvalido
      errors.add(:base, 'formula invalida')
    end

  end

#Employee.columns_hash["legajo"].type

  def calculate_changes
      Liquidacion.where(:fecha_cierre.nil?).each do |l|
        recibos=ReciboSueldo.joins(:detalle_recibo_habers).where(:liquidacion_id => l.id).where("detalle_recibo_habers.remunerative_concept_id" => self.id)
        recibos.each do |r|
          Rails.logger.info("Recibo: "+r.employee.legajo+" - "+r.employee.full_name)
          r.calcular_recibo
        end
      end
  end


  def cannot_asociate_iqual_concept
    if (self.concepto_asociado_haber_id == self.concepto_asociado_haber_2_id) && !self.concepto_asociado_haber_id.nil?
      errors.add(:base, 'No puede asociar 2 veces el mismo haber')
    end
    return control_formula
  end

  def all_without_myself
    (new_record?) ? RemunerativeConcept.all : (RemunerativeConcept.all - [self])
  end

  def to_s
    self.try(:detalle) || 'n/a'
  end

end

=begin
                if eval(models[modelos.index(entidad)].classify+".columns_hash['"+
                                variable.gsub(":","")+
                                "'].type == :date")
                  xaeval = xaeval.gsub(entidad+variable, '"' + Date.today.to_param+ '"')
                else
                  if eval(models[modelos.index(entidad)].classify+".columns_hash['"+
                                  variable.gsub(":","")+
                                  "'].type == :string")
                    xaeval = xaeval.gsub(entidad+variable, '"' + position.to_s + '"')
                  else
                    xaeval = xaeval.gsub(entidad+variable, position.to_s )
=end
