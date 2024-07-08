# frozen_string_literal: true

module Capybara
  module Thruster
    class DependencyChecker
      def self.call
        new.call
      end

      def call
        unless thruster_installed?
          warn "*********************************************************"
          warn "Warning: capybara-thruster requires either 'thruster' or 'anycable-thruster' gem."
          warn "Please install one of them to ensure proper functionality."
          warn "*********************************************************"
        end
      end

      private

      def thruster_installed?
        gem_installed?("thruster") || gem_installed?("anycable-thruster")
      end

      def gem_installed?(name)
        Gem::Specification.find_all_by_name(name).any?
      end
    end
  end
end
