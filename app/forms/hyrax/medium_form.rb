# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work Medium`
module Hyrax
  # Generated form for Medium
  class MediumForm < Hyrax::Forms::WorkForm
    self.model_class = ::Medium
    self.terms += [:resource_type]

    def primary_terms
      [:title, :creator, :keyword, :rights_statement, :license]
    end
  end
end
