# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work GenericWork`
module Hyrax
  # Generated form for GenericWork
  class GenericWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::GenericWork
    self.terms += [:resource_type]

    def primary_terms
      [:title, :creator, :keyword, :rights_statement, :license]
    end
  end
end
