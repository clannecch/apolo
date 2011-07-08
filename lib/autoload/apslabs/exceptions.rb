module Apslabs
  module Exceptions

    class HasExercises < Exception
      attr_reader :message

      def initialize(message='Aun existen ejercicios asociados.')
        @message = message
      end
    end

    class IsOpen < Exception
      attr_reader :message

      def initialize(message='El Ejercicio aun esta abierto.')
        @message = message
      end
    end

    class HasEntries < Exception
      attr_reader :message

      def initialize(message='Aun existen asientos asociados.')
        @message = message
      end
    end

    class HasDetails < Exception
      attr_reader :message

      def initialize(message='Aun detalles de asientos asociados.')
        @message = message
      end
    end

  end
end

