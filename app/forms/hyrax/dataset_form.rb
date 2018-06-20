# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work Dataset`
module Hyrax
  # Generated form for Dataset
  class DatasetForm < Hyrax::Forms::WorkForm
    self.model_class = ::Dataset
    self.terms += [:resource_type]

    def primary_terms
      [:title, :creator, :keyword, :rights_statement, :license]
    end
  end
end
