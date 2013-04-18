require 'librarian/puppet/environment'

module Librarian
  module Puppet
    extend self
    extend Librarian

  end
end

module Librarian

  # Fixes for librarian not yet released in their gem
  module Action
    class Install < Base

    private

      def create_install_path
        install_path.rmtree if install_path.exist? && destructive?
        install_path.mkpath
      end

      def destructive?
        environment.config_db.local['destructive'] == 'true'
      end
    end
  end

end
