module Apslabs
  module Validators
    class Exercise < ActiveModel::Validator
      def validate(record)

        # validate delta dates for regular exercises
        if !record.send("#{@options[:uneven]}?") &&
          (record.send(@options[:started_on]) + 12.months - 1.day) != record.send(@options[:finished_on])
          record.errors.add(@options[:finished_on], :regular_exercise_must_be_12_months)
        end

        # validate taken dates
        existing_records = record.class.where(:company_id => record.company_id)
        if existing_records.any?{|e|e.id != record.id && record.started_on.between?(*e.period)}
          record.errors.add(@options[:started_on], :taken)
        end
        if existing_records.any?{|e|e.id != record.id && record.finished_on.between?(*e.period)}
          record.errors.add(@options[:finished_on], :taken)
        end

      end
    end
  end
end

