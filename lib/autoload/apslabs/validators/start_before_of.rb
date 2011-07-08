module Apslabs
  module Validators
    class StartBeforeOf < ActiveModel::Validator
      def validate(record)
        record.errors.add(@options[:field_name], :less_than, :count => record.send(@options[:before_of])) unless record.send(@options[:field_name]) < record.send(@options[:before_of])
      end
    end
  end
end

