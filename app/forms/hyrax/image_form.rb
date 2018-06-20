# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work Image`
module Hyrax
  # Generated form for Image
  class ImageForm < Hyrax::Forms::WorkForm
    self.model_class = ::Image
    self.terms += [:resource_type]

    def primary_terms
      [:title, :creator, :keyword, :rights_statement, :license]
    end
  end
end
