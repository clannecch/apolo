module Apslabs
  module ActiveResource
    module Relations

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def has_many(*args)
          proxy = args.first.to_s
          options = {
            :class_name => proxy.classify,
            :foreign_key => "#{self.to_s.downcase}_id".to_sym,
            :primary_key => :id
          }
          options.update(args.extract_options!)

          define_method(proxy) do
            options[:class_name].constantize.where(options[:foreign_key].to_sym => self.send(options[:primary_key]))
          end

          define_method("#{proxy.classify.downcase}_ids") do
            self.send(proxy).map(&:id)
          end

        end
      end

    end
  end
end

